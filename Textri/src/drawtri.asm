xdef _drawTri

xref __frameset
xref __idivs
xref __imuls
xref _canvas

;   57	
;   58	#define min(x,y) ((x<y) ? x : y) 
;   59	#define max(x,y) ((x>y) ? x : y)
;   60	#define v1x	(p1.x - p0.x)
;   61	#define v1y	(p1.y - p0.y)
;   62	#define v2x	(p2.x - p0.x)
;   63	#define v2y	(p2.y - p0.y)
;   64	
;   65	void drawTri(point p0,point p1,point p2,gfx_sprite_t* texture) { 
_drawTri:
	LD	HL,-147
	CALL	__frameset
;   66		int minx,miny,maxx,maxy; 
;   67		int uinv,vinv; 
;   68		int dudx,dudy,dvdx,dvdy,u,v;
;   69		int w0i,w1i,w2i,w0,w1,w2,w0x,w0y,w1x,w1y,w2x,w2y;
;   70		int x,y; 
;   71	
;   72		uinv = 16*65536 / ((v1x*v1x) + (v1y*v1y)); 
	LD	BC,(IX+6)
	LD	HL,(IX+12)
	OR	A,A
	SBC	HL,BC
	LD	DE,HL
	LD	HL,(IX+12)
	OR	A,A
	LD	BC,(IX+6)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,DE
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+15)
	OR	A,A
	LD	BC,(IX+9)
	SBC	HL,BC
	LD	BC,HL
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-4),BC
	POP	IY
	LD	HL,(IX+15)
	OR	A,A
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-7),BC
	POP	IY
	LD	BC,(IX+9)
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-10),BC	; unspill
	LD	BC,(IY+-7)
	LD	BC,(IY+-10)
	POP	IY
	SBC	HL,BC
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-1),HL
	LD	BC,(IY+-4)
	POP	IY
	LD	HL,BC
	PUSH	IY
	LEA	IY,IX+-128	; unspill
	LD	BC,(IY+-1)
	POP	IY
	CALL	__imuls
	ADD	HL,DE
	LD	BC,HL
	LD	HL,1048576
	CALL	__idivs
	LD	(IX+-9),HL
;   73		vinv = 16*65536 / ((v2x*v2x) + (v2y*v2y)); 
	LD	BC,(IX+6)
	LD	HL,(IX+18)
	OR	A,A
	SBC	HL,BC
	LD	DE,HL
	LD	HL,(IX+18)
	OR	A,A
	LD	BC,(IX+6)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,DE
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+21)
	OR	A,A
	LD	BC,(IX+9)
	SBC	HL,BC
	LD	BC,HL
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-13),BC
	POP	IY
	LD	HL,(IX+21)
	OR	A,A
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-16),BC
	POP	IY
	LD	BC,(IX+9)
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-19),BC	; unspill
	LD	BC,(IY+-16)
	LD	BC,(IY+-19)
	POP	IY
	SBC	HL,BC
	PUSH	IY
	LEA	IY,IX+-128	; spill
	LD	(IY+-1),HL
	LD	BC,(IY+-13)
	POP	IY
	LD	HL,BC
	PUSH	IY
	LEA	IY,IX+-128	; unspill
	LD	BC,(IY+-1)
	POP	IY
	CALL	__imuls
	ADD	HL,DE
	LD	BC,HL
	LD	HL,1048576
	CALL	__idivs
	LD	(IX+-12),HL
;   74		
;   75		dudx = v1x*uinv;
	LD	BC,(IX+6)
	LD	HL,(IX+12)
	OR	A,A
	SBC	HL,BC
	LD	BC,(IX+-9)
	CALL	__imuls
	LD	(IX+-93),HL
;   76		dudy = v1y*uinv; 
	LD	BC,(IX+9)
	LD	HL,(IX+15)
	OR	A,A
	SBC	HL,BC
	LD	BC,(IX+-9)
	CALL	__imuls
	LD	(IX+-84),HL
;   77		dvdx = v2x*vinv;
	LD	BC,(IX+6)
	LD	HL,(IX+18)
	OR	A,A
	SBC	HL,BC
	LD	BC,(IX+-12)
	CALL	__imuls
	LD	(IX+-87),HL
;   78		dvdy = v2y*vinv; 
	LD	BC,(IX+9)
	LD	HL,(IX+21)
	OR	A,A
	SBC	HL,BC
	LD	BC,(IX+-12)
	CALL	__imuls
	LD	(IX+-90),HL
;   79		
;   80		minx = min(p0.x,min(p1.x,p2.x)); 
	LD	BC,(IX+18)
	LD	HL,(IX+12)
	OR	A,A
	SBC	HL,BC
	JP	P,L_6
	LD	BC,(IX+12)
	LD	(IX+-48),BC
	JR	L_7
L_6:
	LD	BC,(IX+18)
	LD	(IX+-48),BC
L_7:
	LD	BC,(IX+-48)
	LD	HL,(IX+6)
	OR	A,A
	SBC	HL,BC
	JP	P,L__23
	JP	PE,L_14
	JR	L__24
L__23:
	JP	PO,L_14
L__24:
	LD	BC,(IX+6)
	LD	(IX+-51),BC
	JR	L_15
L_14:
	LD	BC,(IX+18)
	LD	HL,(IX+12)
	OR	A,A
	SBC	HL,BC
	JP	P,L__25
	JP	PE,L_10
	JR	L__26
L__25:
	JP	PO,L_10
L__26:
	LD	BC,(IX+12)
	LD	(IX+-54),BC
	JR	L_11
L_10:
	LD	BC,(IX+18)
	LD	(IX+-54),BC
L_11:
	LD	BC,(IX+-54)
	LD	(IX+-51),BC
L_15:
	LD	BC,(IX+-51)
	LD	(IX+-15),BC
;   81		miny = min(p0.y,min(p1.y,p2.y));
	LD	BC,(IX+21)
	LD	HL,(IX+15)
	OR	A,A
	SBC	HL,BC
	JP	P,L__27
	JP	PE,L_18
	JR	L__28
L__27:
	JP	PO,L_18
L__28:
	LD	BC,(IX+15)
	LD	(IX+-57),BC
	JR	L_19
L_18:
	LD	BC,(IX+21)
	LD	(IX+-57),BC
L_19:
	LD	BC,(IX+-57)
	LD	HL,(IX+9)
	OR	A,A
	SBC	HL,BC
	JP	P,L__29
	JP	PE,L_26
	JR	L__30
L__29:
	JP	PO,L_26
L__30:
	LD	BC,(IX+9)
	LD	(IX+-60),BC
	JR	L_27
L_26:
	LD	BC,(IX+21)
	LD	HL,(IX+15)
	OR	A,A
	SBC	HL,BC
	JP	P,L__31
	JP	PE,L_22
	JR	L__32
L__31:
	JP	PO,L_22
L__32:
	LD	BC,(IX+15)
	LD	(IX+-63),BC
	JR	L_23
L_22:
	LD	BC,(IX+21)
	LD	(IX+-63),BC
L_23:
	LD	BC,(IX+-63)
	LD	(IX+-60),BC
L_27:
	LD	BC,(IX+-60)
	LD	(IX+-18),BC
;   82		maxx = max(p0.x,max(p1.x,p2.x)); 
	LD	BC,(IX+12)
	LD	HL,(IX+18)
	OR	A,A
	SBC	HL,BC
	JP	P,L__33
	JP	PE,L_30
	JR	L__34
L__33:
	JP	PO,L_30
L__34:
	LD	BC,(IX+12)
	LD	(IX+-66),BC
	JR	L_31
L_30:
	LD	BC,(IX+18)
	LD	(IX+-66),BC
L_31:
	LD	BC,(IX+6)
	LD	HL,(IX+-66)
	OR	A,A
	SBC	HL,BC
	JP	P,L__35
	JP	PE,L_38
	JR	L__36
L__35:
	JP	PO,L_38
L__36:
	LD	BC,(IX+6)
	LD	(IX+-69),BC
	JR	L_39
L_38:
	LD	BC,(IX+12)
	LD	HL,(IX+18)
	OR	A,A
	SBC	HL,BC
	JP	P,L__37
	JP	PE,L_34
	JR	L__38
L__37:
	JP	PO,L_34
L__38:
	LD	BC,(IX+12)
	LD	(IX+-72),BC
	JR	L_35
L_34:
	LD	BC,(IX+18)
	LD	(IX+-72),BC
L_35:
	LD	BC,(IX+-72)
	LD	(IX+-69),BC
L_39:
	LD	BC,(IX+-69)
	LD	(IX+-117),BC
;   83		maxy = max(p0.y,max(p1.y,p2.y));
	LD	BC,(IX+15)
	LD	HL,(IX+21)
	OR	A,A
	SBC	HL,BC
	JP	P,L__39
	JP	PE,L_42
	JR	L__40
L__39:
	JP	PO,L_42
L__40:
	LD	BC,(IX+15)
	LD	(IX+-75),BC
	JR	L_43
L_42:
	LD	BC,(IX+21)
	LD	(IX+-75),BC
L_43:
	LD	BC,(IX+9)
	LD	HL,(IX+-75)
	OR	A,A
	SBC	HL,BC
	JP	P,L__41
	JP	PE,L_50
	JR	L__42
L__41:
	JP	PO,L_50
L__42:
	LD	BC,(IX+9)
	LD	(IX+-78),BC
	JR	L_51
L_50:
	LD	BC,(IX+15)
	LD	HL,(IX+21)
	OR	A,A
	SBC	HL,BC
	JP	P,L__43
	JP	PE,L_46
	JR	L__44
L__43:
	JP	PO,L_46
L__44:
	LD	BC,(IX+15)
	LD	(IX+-81),BC
	JR	L_47
L_46:
	LD	BC,(IX+21)
	LD	(IX+-81),BC
L_47:
	LD	BC,(IX+-81)
	LD	(IX+-78),BC
L_51:
	LD	BC,(IX+-78)
	LD	(IX+-96),BC
;   84		
;   85		uinv = (minx-p0.x)*dudx + (miny-p0.y)*dudy; 
	LD	BC,(IX+6)
	LD	HL,(IX+-15)
	OR	A,A
	SBC	HL,BC
	LD	BC,(IX+-93)
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+-18)
	OR	A,A
	LD	BC,(IX+9)
	SBC	HL,BC
	LD	BC,(IX+-84)
	CALL	__imuls
	ADD	HL,DE
	LD	(IX+-9),HL
;   86		vinv = (minx-p0.x)*dvdx + (miny-p0.y)*dvdy;
	LD	BC,(IX+6)
	LD	HL,(IX+-15)
	OR	A,A
	SBC	HL,BC
	LD	BC,(IX+-87)
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+-18)
	OR	A,A
	LD	BC,(IX+9)
	SBC	HL,BC
	LD	BC,(IX+-90)
	CALL	__imuls
	ADD	HL,DE
	LD	(IX+-12),HL
;   87		
;   88		w0i = (p2.x-p1.x)*(miny-p1.y) - (p2.y-p1.y)*(minx-p1.x); 
	LD	BC,(IX+12)
	LD	HL,(IX+18)
	OR	A,A
	SBC	HL,BC
	LD	DE,HL
	LD	HL,(IX+-18)
	OR	A,A
	LD	BC,(IX+15)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,DE
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+21)
	OR	A,A
	LD	BC,(IX+15)
	SBC	HL,BC
	LD	(IX+-120),HL
	LD	HL,(IX+-15)
	OR	A,A
	LD	BC,(IX+12)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,(IX+-120)
	CALL	__imuls
	LD	BC,HL
	LD	HL,DE
	OR	A,A
	SBC	HL,BC
	LD	(IX+-21),HL
;   89		w1i = (p0.x-p2.x)*(miny-p2.y) - (p0.y-p2.y)*(minx-p2.x); 
	LD	BC,(IX+18)
	LD	HL,(IX+6)
	OR	A,A
	SBC	HL,BC
	LD	DE,HL
	LD	HL,(IX+-18)
	OR	A,A
	LD	BC,(IX+21)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,DE
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+9)
	OR	A,A
	LD	BC,(IX+21)
	SBC	HL,BC
	LD	(IX+-123),HL
	LD	HL,(IX+-15)
	OR	A,A
	LD	BC,(IX+18)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,(IX+-123)
	CALL	__imuls
	LD	BC,HL
	LD	HL,DE
	OR	A,A
	SBC	HL,BC
	LD	(IX+-24),HL
;   90		w2i = (p1.x-p0.x)*(miny-p0.y) - (p1.y-p0.y)*(minx-p0.x);
	LD	BC,(IX+6)
	LD	HL,(IX+12)
	OR	A,A
	SBC	HL,BC
	LD	DE,HL
	LD	HL,(IX+-18)
	OR	A,A
	LD	BC,(IX+9)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,DE
	CALL	__imuls
	LD	DE,HL
	LD	HL,(IX+15)
	OR	A,A
	LD	BC,(IX+9)
	SBC	HL,BC
	LD	(IX+-126),HL
	LD	HL,(IX+-15)
	OR	A,A
	LD	BC,(IX+6)
	SBC	HL,BC
	LD	BC,HL
	LD	HL,(IX+-126)
	CALL	__imuls
	LD	BC,HL
	LD	HL,DE
	OR	A,A
	SBC	HL,BC
	LD	(IX+-27),HL
;   91		
;   92		w0x = (p2.y-p1.y);
	LD	BC,(IX+15)
	LD	HL,(IX+21)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-99),HL
;   93		w0y = (p2.x-p1.x);
	LD	BC,(IX+12)
	LD	HL,(IX+18)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-102),HL
;   94		w1x = (p0.y-p2.y);
	LD	BC,(IX+21)
	LD	HL,(IX+9)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-105),HL
;   95		w1y = (p0.x-p2.x);
	LD	BC,(IX+18)
	LD	HL,(IX+6)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-108),HL
;   96		w2x = (p1.y-p0.y);
	LD	BC,(IX+9)
	LD	HL,(IX+15)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-111),HL
;   97		w2y = (p1.x-p0.x);
	LD	BC,(IX+6)
	LD	HL,(IX+12)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-114),HL
;   98		for(y = miny;y <= maxy;y++) {
	LD	BC,(IX+-18)
	LD	(IX+-6),BC
	JR	L_68
L_66:
;   99			u = uinv; 
	LD	BC,(IX+-9)
	LD	(IX+-39),BC
;  100			v = vinv; 
	LD	BC,(IX+-12)
	LD	(IX+-45),BC
;  101			w0 = w0i; 
	LD	BC,(IX+-21)
	LD	(IX+-30),BC
;  102			w1 = w1i; 
	LD	BC,(IX+-24)
	LD	(IX+-33),BC
;  103			w2 = w2i;
	LD	BC,(IX+-27)
	LD	(IX+-36),BC
;  104			for(x = minx;x <= maxx;x++) {
	LD	BC,(IX+-15)
	LD	(IX+-3),BC
	JR	L_64
L_62:
;  105				if(x>=0 && x<160 && y>=0 && y<120) {	
	LD	BC,0
	LD	HL,(IX+-3)
	OR	A,A
	SBC	HL,BC
	JP	M,L__45
	JP	PE,L_61
	JR	L__46
L__45:
	JP	PO,L_61
L__46:
	LD	BC,160
	LD	HL,(IX+-3)
	OR	A,A
	SBC	HL,BC
	JP	P,L__47
	JP	PE,L_61
	JR	L__48
L__47:
	JP	PO,L_61
L__48:
	LD	BC,0
	LD	HL,(IX+-6)
	OR	A,A
	SBC	HL,BC
	JP	M,L__49
	JP	PE,L_61
	JR	L__50
L__49:
	JP	PO,L_61
L__50:
	LD	BC,120
	LD	HL,(IX+-6)
	OR	A,A
	SBC	HL,BC
	JP	P,L__51
	JP	PE,L_61
	JR	L__52
L__51:
	JP	PO,L_61
L__52:
;  106					if((w0 >= 0) && (w1 >= 0) && (w2 >= 0)) { 
	LD	BC,0
	LD	HL,(IX+-30)
	OR	A,A
	SBC	HL,BC
	JP	M,L__53
	JP	PE,L_61
	JR	L__54
L__53:
	JP	PO,L_61
L__54:
	LD	BC,0
	LD	HL,(IX+-33)
	OR	A,A
	SBC	HL,BC
	JP	M,L__55
	JP	PE,L_61
	JR	L__56
L__55:
	JP	PO,L_61
L__56:
	LD	BC,0
	LD	HL,(IX+-36)
	OR	A,A
	SBC	HL,BC
	JP	M,L__57
	JP	PE,L_61
	JR	L__58
L__57:
	JP	PO,L_61
L__58:
;  107						uint8_t ui,vi,p; 
;  108						ui = u>>16; 
	LD	A,(IX+-37)
	AND	A,15
	EX	AF,AF'
;  109						vi = v>>16; 
	LD	A,(IX+-43)
;  110						p = texture->data[(vi&0x0F)*16 + (ui&0x0F)]; 
	AND	A,15
	LD	C,A
	LD 	B,16
	MLT BC
	EX	AF,AF'
	UEXT	HL
	LD	L,A
	ADD	HL,BC
	LD	BC,HL
	LD	HL,(IX+24)
	INC HL 
	INC HL
	ADD	HL,BC
	LD	A,(HL)
;  111						canvas->data[y*160 + x] = p; 
	LD	L,(IX+-6)
	LD	H,160 
	MLT HL
	LD	BC,(IX+-3)
	ADD	HL,BC
	LD	BC,HL
	LD	HL,(_canvas)
	INC HL 
	INC HL
	ADD	HL,BC
	LD	(HL),A
;  112					} 
;  113				}
L_61:
;  114				u += dudx; 
	LD	BC,(IX+-93)
	LD	HL,(IX+-39)
	ADD	HL,BC
	LD	(IX+-39),HL
;  115				v += dvdx;
	LD	BC,(IX+-87)
	LD	HL,(IX+-45)
	ADD	HL,BC
	LD	(IX+-45),HL
;  116				w0 -= w0x;
	LD	BC,(IX+-99)
	LD	HL,(IX+-30)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-30),HL
;  117				w1 -= w1x;
	LD	BC,(IX+-105)
	LD	HL,(IX+-33)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-33),HL
;  118				w2 -= w2x;
	LD	BC,(IX+-111)
	LD	HL,(IX+-36)
	OR	A,A
	SBC	HL,BC
	LD	(IX+-36),HL
	LD	BC,(IX+-3)
	INC	BC
	LD	(IX+-3),BC
;  119			} 
L_64:
	LD	BC,(IX+-3)
	LD	HL,(IX+-117)
	OR	A,A
	SBC	HL,BC
	JP	P,L__59
	JP	PE,L_62
	JR	L__60
L__59:
	JP	PO,L_62
L__60:
;  120			uinv += dudy;
	LD	BC,(IX+-84)
	LD	HL,(IX+-9)
	ADD	HL,BC
	LD	(IX+-9),HL
;  121			vinv += dvdy;
	LD	BC,(IX+-90)
	LD	HL,(IX+-12)
	ADD	HL,BC
	LD	(IX+-12),HL
;  122			w0i += w0y;
	LD	BC,(IX+-102)
	LD	HL,(IX+-21)
	ADD	HL,BC
	LD	(IX+-21),HL
;  123			w1i += w1y;
	LD	BC,(IX+-108)
	LD	HL,(IX+-24)
	ADD	HL,BC
	LD	(IX+-24),HL
;  124			w2i += w2y;
	LD	BC,(IX+-114)
	LD	HL,(IX+-27)
	ADD	HL,BC
	LD	(IX+-27),HL
	LD	BC,(IX+-6)
	INC	BC
	LD	(IX+-6),BC
;  125		} 
L_68:
	LD	BC,(IX+-6)
	LD	HL,(IX+-96)
	OR	A,A
	SBC	HL,BC
	JP	P,L__61
	JP	PE,L_66
	JR	L__62
L__61:
	JP	PO,L_66
L__62:
;  126		
;  127	} 
	LD	SP,IX
	POP	IX
	RET	
