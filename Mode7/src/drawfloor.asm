xdef _drawFloor 

xref __frameset
xref _canvas_data
xref _xstart

sin	equ ix-3
cos	equ ix-6
rs 	equ ix-9
rc	equ ix-12 
u	equ ix-15 
v	equ ix-18
;angle ix+6
;x	ix+9 
;y ix+12 
;z ix+15 
;texture ix+18
;  112	void drawFloor(uint8_t angle,int x,int y,int z,uint8_t* texture) {
_drawFloor:
	ld	hl,-18
	di
	call __frameset
	ld	bc,_xstart
	ld	d,60*3
;  122		s = xstart[angle]; 
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
	
	
	ld hl,_canvas_data+2
	push hl
	ld a,60 
yloop:
	ex af,af'	
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
	ld l,80
	exx
	
	ld bc,(ix+18)
	pop de
	push ix 
	ld iy,(v)
	ld ix,(u)
xloop:
;draw pixel 
	ld a,iyh
	and a,15
	ld l,a 
	ld h,16 
	mlt hl 
	ld a,ixh 
	and a,15 
	add a,l
	ld l,a 
	add hl,bc 
	ld a,(hl) 
	ld (de),a 
	inc de

;	u += du , v += dv 
	exx  
	add ix,de 
	add iy,bc 
	dec l
	exx

	jr nz,xloop
	
	pop ix 
	push de
	ex af,af' 
	dec a
	jr nz,yloop 
	
	ld sp,ix 
	pop ix 
	ret 

;HL*A/256
mulHL_A: 
	ex de,hl 
	uext hl 
	sbc hl,de 
	jp p,$neg 
	ex de,hl
	ld d,l 
	ld e,a 
	mlt de 
	ld e,d 
	push hl
	inc sp 
	pop hl 
	dec sp 
	ld b,l 
	ld c,a 
	mlt bc 
	ld l,a
	mlt hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	ld h,0 
	ld d,h
	add hl,de 
	add hl,bc 
	ret 
$neg: 
	ld d,l 
	ld e,a 
	mlt de 
	ld e,d 
	push hl
	inc sp 
	pop hl 
	dec sp 
	ld b,l 
	ld c,a 
	mlt bc 
	ld l,a
	mlt hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	ld h,0 
	ld d,h 
	add hl,de 
	add hl,bc
	ex de,hl 
	uext hl 
	sbc hl,de 
	ret 