xdef _drawFloor 

xref __frameset
xref __idivs
xref __imuls
xref _canvas_data
xref _xstart

sin	equ ix-3
cos	equ ix-6
rs 	equ ix-9
rc	equ ix-12 
u 	equ ix-15
v 	equ ix-18 

;angle ix+6
;x	ix+9 
;y ix+12 
;z ix+15 
;texture ix+18
;  112	void drawFloor(uint8_t angle,int x,int y,int z,gfx_sprite_t* texture) {
_drawFloor:
	ld	hl,-18
	di
	call __frameset
	ld	bc,_xstart
;  122		s = xstart[angle]; 
	ld	d,48*3
	ld	a,(ix+6)
	ld	l,a
	ld	h,d
	mlt hl
	add	hl,bc
	ld	(sin),hl
;  123		c = xstart[(angle+16)&63]; 
	add a,16 
	and	a,63
	ld	l,a
	ld	h,d
	mlt hl 
	add	hl,bc
	ld	(cos),hl
;  124		rs = xstart[(angle+59)&63]; 
	add a,59-16
	and	a,63
	ld	l,a
	ld 	h,d
	mlt hl
	add	hl,bc
	ld	(rs),hl
;  125		rc = xstart[(angle+59+16)&63]; 
	add a,16
	and a,63
	ld	l,a
	ld	h,d 
	mlt hl
	add	hl,bc
	ld	(rc),hl
	
	ld iyh,48
	ld hl,_canvas_data+2
	push hl
yloop:
	ld a,(ix+15) 
;  128			u = *(rc++)*z*80 + x; 
	ld hl,(rc) 
	ld de,(hl) 
	inc hl 
	inc hl 
	inc hl 
	ld (rc),hl 
	 
	ex de,hl
	call mulHL_A
	
	add hl,hl 
	add hl,hl 
	add hl,hl 
	add hl,hl 
	ld de,hl 
	add hl,hl 
	add hl,hl 
	add hl,de 
	ld de,(ix+9) 
	add hl,de 
	ld (u),hl 
;  130			du = *(s++)*-z;
	ld hl,(sin) 
	ld de,(hl) 
	inc hl 
	inc hl 
	inc hl  
	ld (sin),hl
	uext hl 
	sbc hl,de 
	
	call mulHL_A
	
	ex de,hl ; de' = du 
;  129			v = *(rs++)*z*80 + y;
	exx 
	ld hl,(rs) 
	ld de,(hl) 
	inc hl 
	inc hl 
	inc hl 
	ld (rs),hl 
	
	ex de,hl 
	call mulHL_A
	
	add hl,hl 
	add hl,hl 
	add hl,hl 
	add hl,hl 
	ld de,hl 
	add hl,hl 
	add hl,hl 
	add hl,de 
	ld de,(ix+12) 
	add hl,de 
	ld (v),hl
;  131			dv = *(c++)*z;
	ld hl,(cos) 
	ld de,(hl) 
	inc hl 
	inc hl 
	inc hl 
	ld (cos),hl 
	
	ex de,hl
	call mulHL_A
	
	push hl
	exx 
	pop bc ; bc' = dv
	exx

	ld iyl,80 
	ld bc,(ix+18)
	pop de
xloop:
;draw pixel 
	ld a,(v+2)
	and a,15
	ld l,a 
	ld h,16 
	mlt hl 
	ld a,(u+2) 
	and a,15 
	add a,l
	ld l,a 
	add hl,bc 
	ld a,(hl) 
	ld (de),a 
	inc de

;	u += du , v += dv 
	exx 
	ld hl,(u) 
	add hl,de 
	ld (u),hl 
	ld hl,(v) 
	add hl,bc 
	ld (v),hl
	exx
	
	dec iyl 
	jr nz,xloop 
	
	push de
	dec iyh 
	jr nz,yloop 
	
	ld sp,ix 
	pop ix 
	ret 

mulHL_A: 
	ld de,0 
	rrca 
	jr nc,$l1
	ex de,hl 
	add hl,de 
	ex de,hl 
$l1:add hl,hl 
	rrca 
	jr nc,$l2
	ex de,hl 
	add hl,de 
	ex de,hl 
$l2:add hl,hl 
	rrca 
	jr nc,$l3
	ex de,hl 
	add hl,de 
	ex de,hl 
$l3:add hl,hl 
	rrca 
	jr nc,$l4
	ex de,hl 
	add hl,de 
	ex de,hl 
$l4:add hl,hl 
	rrca 
	jr nc,$l5
	ex de,hl 
	add hl,de 
	ex de,hl 
$l5:add hl,hl 
	rrca 
	jr nc,$l6
	ex de,hl 
	add hl,de 
	ex de,hl 
$l6:add hl,hl 
	rrca 
	jr nc,$l7
	ex de,hl 
	add hl,de 
	ex de,hl 
$l7:add hl,hl 
	rrca 
	jr nc,$l8
	ex de,hl 
	add hl,de 
	ex de,hl 
$l8:
	ex de,hl 
	ret 