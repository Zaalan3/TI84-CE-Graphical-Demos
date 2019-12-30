;C output edited for speed

xdef _drawFloor 

xref __frameset
xref __idivs
xref __imuls
xref _canvas
xref _tileset_tile_1_data
xref _tileset_tile_0_data
xref _xstart

;  112	void drawFloor(uint8_t angle,int x,int y,int z,gfx_sprite_t* texture) {
_drawFloor:
	LD	HL,-29
	CALL	__frameset
;  113		int u,v,du,dv;
;  114		int* s;
;  115		int* c;
;  116		int* rs;
;  117		int* rc;
;  118		int offset;
;  119		uint8_t i,j; 
;  120		
;  121		offset = 0;
	UEXT	HL
	LD	(IX+-20),HL
	
	LD	BC,(IX+18) 
	INC BC
	INC BC
	LD (IX+18),BC
;  122		s = xstart[angle]; 
	LD	BC,_xstart
	LD	D,48*3
	LD	A,(IX+6)
	LD	L,A
	LD	H,D
	MLT HL
	ADD	HL,BC
	LD	(IX+-8),HL
;  123		c = xstart[(angle+16)&63]; 
	ADD A,16 
	AND	A,63
	LD	L,A
	LD	H,D
	MLT HL 
	ADD	HL,BC
	LD	(IX+-11),HL
;  124		rs = xstart[(angle+59)&63]; 
	ADD A,59-16
	AND	A,63
	LD	L,A
	LD 	H,D
	MLT HL
	ADD	HL,BC
	LD	(IX+-14),HL
;  125		rc = xstart[(angle+59+16)&63]; 
	ADD A,16
	AND A,63
	LD	L,A
	LD	H,D 
	MLT HL
	ADD	HL,BC
	LD	(IX+-17),HL
;  126		
;  127		for(i = 0; i < 48;i++) {  
	LD	(IX+-1),48
L_42:
	LD	IY,(IX+15)
;  128			u = *(rc++)*z + x; 
	LD	HL,(IX+-17)
	LD	BC,(HL) 
	INC HL 
	INC HL 
	INC HL
	LD	(IX+-17),HL 
	LEA	HL,IY+0
	CALL	__imuls
	LD	BC,(IX+9)
	ADD	HL,BC
	LD	(IX+-23),HL
;  129			v = *(rs++)*z + y; 
	LD	HL,(IX+-14)
	LD	BC,(HL)
	INC HL
	INC HL 
	INC HL 
	LD	(IX+-14),HL
	LEA	HL,IY+0
	CALL	__imuls
	LD	BC,(IX+12)
	ADD	HL,BC
	LD	(IX+-5),HL
;  130			du = *(s++)*z / -80; 
	LD	HL,(IX+-8)
	LD	BC,(HL)
	INC HL 
	INC HL 
	INC HL
	LD	(IX+-8),HL 
	LEA	HL,IY+0
	CALL	__imuls
	LD	BC,-80
	CALL	__idivs
	LD	(IX+-29),HL
;  131			dv = *(c++)*z / 80;
	LD	HL,(IX+-11)
	LD	BC,(HL)
	INC HL 
	INC HL 
	INC HL
	LD (IX+-11),HL
	LEA	HL,IY+0
	CALL	__imuls
	LD	BC,80
	CALL	__idivs
	LD	(IX+-26),HL
;  132			
;  133			for(j = 80;j > 0;j--) {
	LD	(IX+-2),80
	LD	BC,(IX+18)
	LD	IY,(_canvas)
L_39:
;  134				canvas->data[offset++] = tileset_tile_1->data[((v>>8)&0x0F)*16
;  135					+ ((u>>8)&0x0F)]; 
	LD	A,(IX+-4)
	AND	A,15
	LD	L,A
	LD	H,16 
	MLT HL
	EX	DE,HL
	LD	A,(IX+-22)
	AND	A,15
	UEXT	HL
	LD	L,A
	ADD	HL,DE
	ADD	HL,BC
	LD	A,(HL)
	LEA	HL,IY+2
	LD	DE,(IX+-20)
	ADD	HL,DE
	LD	(HL),A
	INC	DE
	LD	(IX+-20),DE
;  136				u += du;
	LD	DE,(IX+-29)
	LD	HL,(IX+-23)
	ADD	HL,DE
	LD	(IX+-23),HL
;  137				v += dv;
	LD	DE,(IX+-26)
	LD	HL,(IX+-5)
	ADD	HL,DE
	LD	(IX+-5),HL
	
;  138			} 
L_41:
	DEC	(IX+-2)
	JR	NZ,L_39
	
;  139		} 
L_44:
	DEC	(IX+-1)
	JR	NZ,L_42
;  140		
;  141	} 
	LD	SP,IX
	POP	IX
	RET	


;**************************** _drawFloor ***************************
;Name                         Addr/Register   Size   Type
;_canvas                             STATIC      3   variable
;_tileset_tile_1_data                IMPORT  unknown variable
;_xstart                             STATIC   9216   variable
;du                                   IX-29      3   variable
;dv                                   IX-26      3   variable
;u                                    IX-23      3   variable
;offset                               IX-20      3   variable
;rc                                   IX-17      3   variable
;rs                                   IX-14      3   variable
;c                                    IX-11      3   variable
;s                                     IX-8      3   variable
;v                                     IX-5      3   variable
;j                                     IX-2      1   variable
;i                                     IX-1      1   variable
;texture							  IX+18		 3   parameter
;z                                    IX+15      3   parameter
;y                                    IX+12      3   parameter
;x                                     IX+9      3   parameter
;angle                                 IX+6      1   parameter
