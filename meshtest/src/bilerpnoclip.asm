xdef _bilerpInit

xref __frameset

_bilerpInit: 
	ld hl,bilerp_noclip 
	ld de,0E30A00h 
	ld bc,bilerp_end-bilerp_noclip
	ldir 
	ret
	


;   97	void bilerp(uint24_t x0,uint24_t x1,uint24_t x2,uint24_t x3,uint24_t y0,uint24_t y1,uint24_t y2,uint24_t y3,uint8_t* texture) {
bilerp_noclip:
	ld	hl,-38
	call	__frameset
;   98	    int24_t ax = (x0 - x1 - x3 + x2);
	di 
	ld	bc,(ix+9)
	ld	hl,(ix+15)
	add	hl,bc
	ld	bc,hl
	ld	hl,(ix+6)
	or	a,a
	sbc	hl,bc
	ld	bc,(ix+12)
	add	hl,bc
	ld	(ix+-35),hl
;   99	    int24_t ay = (y0 - y1 - y3 + y2);
	ld	bc,(ix+21)
	ld	hl,(ix+27)
	add	hl,bc
	ld	bc,hl
	ld	hl,(ix+18)
	or	a,a
	sbc	hl,bc
	ld	bc,(ix+24)
	add	hl,bc
	ld	(ix+-38),hl
;  100		int24_t bx = (x1 - x0)*16; 
	ld	bc,(ix+6)
	ld	hl,(ix+9)
	or	a,a
	sbc	hl,bc
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(ix+-7),hl
;  101	    int24_t by = (y1 - y0)*16; 
	ld	bc,(ix+18)
	ld	hl,(ix+21)
	or	a,a
	sbc	hl,bc
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(ix+-10),hl
;  102	    int24_t cx = (x3 - x0)*16;
	ld	bc,(ix+6)
	ld	hl,(ix+15)
	or	a,a
	sbc	hl,bc
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(ix+-29),hl
;  103	    int24_t cy = (y3 - y0)*16;
	ld	bc,(ix+18)
	ld	hl,(ix+27)
	or	a,a
	sbc	hl,bc
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(ix+-32),hl
	
;  108		int24_t pyi = (y0*256);
	exx 
	ld	hl,(ix+18)
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	
;  104			
;  105	    uint8_t u,v;
;  106		uint8_t i;  
;  107		int24_t pxi = (x0*256); 
	ex de,hl 
	ld	hl,(ix+6)
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	exx 

;  111	    for( v = 16; v > 0; v--) {
	ld	iyh,16
	ld de,(0E30014h) 
	exx
l_17:
;  112	        int24_t px = pxi;
	ld	(ix+-13),hl
;  113	        int24_t py = pyi;
	ld	(ix+-16),de
	exx 
;  114	
;  115	        for( u = 16; u > 0; u-- ) {
	ld iyl,16
l_13:
;  118				uint8_t tp = texture[i++];
	ex af,af'
	uext	hl
	ld	l,a
	inc a 
	ex af,af' 
	ld	bc,(ix+30)
	add	hl,bc
	ld	a,(hl)
	or	a,a
	jr	z,l_12
;  116				drawpixel;
	ld	l,(ix+-15) ; l = y
	ld bc,0 
	ld	c,(ix+-12) ; bc = x 
	ld 	b, (ix+-11)
	;drawpixel
	ld h,160 
	mlt hl
	add hl,hl 
	add hl,de 
	add hl,bc
	ld (hl),a
l_12:
;  120	            px += bx;
	ld	bc,(ix+-7)
	ld	hl,(ix+-13)
	add	hl,bc
	ld	(ix+-13),hl
;  121	            py += by;
	ld	bc,(ix+-10)
	ld	hl,(ix+-16)
	add	hl,bc
	ld	(ix+-16),hl
;  122	        }
	dec iyl  
	jr	nz,l_13
l_15:
;  125			bx += ax; 
	ld	bc,(ix+-35)
	ld	hl,(ix+-7)
	add	hl,bc
	ld	(ix+-7),hl
;  126			by += ay; 
	ld	bc,(ix+-38)
	ld	hl,(ix+-10)
	add	hl,bc
	ld	(ix+-10),hl
;  123			pxi += cx; 
	exx 
	ld	bc,(ix+-29)
	add	hl,bc
;  124			pyi += cy; 
	ex de,hl 
	ld	bc,(ix+-32)
	add	hl,bc
	ex de,hl 
;  127	    } 
	dec iyh 
	jr nz,l_17
l_19:	
;  128	
;  129	}
	ld	sp,ix
	pop	ix
	ret	
bilerp_end: 
	nop 
	