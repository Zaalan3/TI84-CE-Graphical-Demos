/* Keep these headers */
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <tice.h>

/* Standard headers (recommended) */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <graphx.h>
#include <keypadc.h>

#include "gfx/pal.h" 
#include "gfx/tileset.h" 

extern void drawFloor(uint8_t angle,int x,int y,int z,gfx_sprite_t* texture); 
void generateTables(void); 

int sintable[64];
int xstart[64][48]; 

gfx_UninitedSprite(canvas,80,48); 

void main(void) {
	int i,x,y,z;
	gfx_sprite_t* tex;
	
	//init 
	gfx_Begin(); 
	gfx_SetPalette(pal_pal,sizeof_pal_pal,0); 
	gfx_ZeroScreen(); 
	gfx_SetDrawBuffer(); 
	
	gfx_SetTextBGColor(0); 
	gfx_SetTextTransparentColor(0);
	gfx_SetTextFGColor(0xFF); 
	
	canvas->width = 80; 
	canvas->height = 48; 
   
	generateTables(); 
	
	i = 0; 
	x = 0; 
	y = 0;
	z = 8; 
	tex = tileset_tile_1;
	
	// main loop 
	kb_Scan();
	while(!kb_IsDown(kb_KeyClear)){
		drawFloor(i,x,y,z,tex); 
		gfx_ZeroScreen();
		gfx_SetTextXY(10,10); 
		gfx_PrintUInt(i,1); 
		gfx_PrintChar(' '); 
		gfx_PrintUInt(z,1);
		
		gfx_ScaledSprite_NoClip(canvas,0,240-96,4,2);
		
		gfx_SwapDraw(); 
		
		if(kb_IsDown(kb_KeyUp)) { 
			x += 2*sintable[(i+16)&63];
			y += 2*sintable[i]; 
		}
		if(kb_IsDown(kb_KeyDown)) { 
			x -= 2*sintable[(i+16)&63];
			y -= 2*sintable[i]; 
		}
		if(kb_IsDown(kb_KeyLeft)) { 
			i = (i+63)&63; 
		} 
		if(kb_IsDown(kb_KeyRight)) { 
			i = (i+1)&63; 
		}
		if(kb_IsDown(kb_KeyAdd)) { 
			z++; 
		} 
		if(kb_IsDown(kb_KeySub)) { 
			z--; 
		}
		
		kb_Scan();
	}; 
   
	// cleanup
	gfx_End(); 
}


 
void generateTables() { 
	int i,j; 
 	
	for(i = 0;i < 64;i++) {
		sintable[i] = 256.0*sin((M_PI/32.0) * i);
	}
	
	for(i = 0;i < 48;i++) { 
		for(j = 0;j < 64;j++) {
			xstart[j][i] = (150.375*sintable[j]) / (i+12);
		} 
	} 

} 

/*
void drawFloor(uint8_t angle,int x,int y,int z,gfx_sprite_t texture) {
	int u,v,du,dv;
	int* s;
	int* c;
	int* rs;
	int* rc;
	int offset;
	uint8_t i,j; 
	
	offset = 0;
	s = xstart[angle]; 
	c = xstart[(angle+16)&63]; 
	rs = xstart[(angle+59)&63]; 
	rc = xstart[(angle+59+16)&63]; 
	
	for(i = 0; i < 48;i++) {  
		u = *(rc++)*z + x; 
		v = *(rs++)*z + y; 
		du = *(s++)*z / -80; 
		dv = *(c++)*z / 80;
		
		for(j = 80;j > 0;j--) {
			canvas->data[offset++] = texture->data[((v>>8)&0x0F)*16
				+ ((u>>8)&0x0F)]; 
			u += du;
			v += dv;
		} 
	} 
	
} 
*/