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

typedef struct { 
	int x; 
	int y; 
} point;

extern void drawTri(point p0,point p1,point p2,gfx_sprite_t* texture); 

gfx_UninitedSprite(canvas,160,120); 

void main(void) {
	point p0,p1,p2; 
	double angle = 0.0;
	gfx_Begin(); 
	gfx_SetPalette(pal_pal,sizeof_pal_pal,0); 
	gfx_SetDrawBuffer();
	gfx_SetColor(0xFF); 
	
	canvas->width = 160; 
	canvas->height = 120; 
	
	while(!os_GetCSC()) {
		p0.x = 80 + 20*cos(angle) - 20*sin(angle); 
		p0.y = 60 + 20*sin(angle) + 20*cos(angle);
		p1.x = 80 + 40*cos(angle) - 25*sin(angle); 
		p1.y = 60 + 40*sin(angle) + 25*cos(angle);
		p2.x = 80 + 20*cos(angle) - 30*sin(angle); 
		p2.y = 60 + 20*sin(angle) + 30*cos(angle);
		
		gfx_ZeroScreen(); 
		drawTri(p0,p1,p2,tileset_tile_1);
		gfx_ScaledSprite_NoClip(canvas,0,0,2,2);
		gfx_SwapDraw();
		memset(canvas+2,0,160*120);
		angle += M_PI/40.0;
	}
	
	gfx_End();
} 

#define min(x,y) ((x<y) ? x : y) 
#define max(x,y) ((x>y) ? x : y)
#define v1x	(p1.x - p0.x)
#define v1y	(p1.y - p0.y)
#define v2x	(p2.x - p0.x)
#define v2y	(p2.y - p0.y)
/*
void drawTri(point p0,point p1,point p2,gfx_sprite_t* texture) { 
	int minx,miny,maxx,maxy; 
	int uinv,vinv; 
	int dudx,dudy,dvdx,dvdy,u,v;
	int w0i,w1i,w2i,w0,w1,w2,w0x,w0y,w1x,w1y,w2x,w2y;
	int x,y; 

	uinv = 16*65536 / ((v1x*v1x) + (v1y*v1y)); 
	vinv = 16*65536 / ((v2x*v2x) + (v2y*v2y)); 
	
	dudx = v1x*uinv;
	dudy = v1y*uinv; 
	dvdx = v2x*vinv;
	dvdy = v2y*vinv; 
	
	minx = min(p0.x,min(p1.x,p2.x)); 
	miny = min(p0.y,min(p1.y,p2.y));
	maxx = max(p0.x,max(p1.x,p2.x)); 
	maxy = max(p0.y,max(p1.y,p2.y));
	
	uinv = (minx-p0.x)*dudx + (miny-p0.y)*dudy; 
	vinv = (minx-p0.x)*dvdx + (miny-p0.y)*dvdy;
	
	w0i = (p2.x-p1.x)*(miny-p1.y) - (p2.y-p1.y)*(minx-p1.x); 
	w1i = (p0.x-p2.x)*(miny-p2.y) - (p0.y-p2.y)*(minx-p2.x); 
	w2i = (p1.x-p0.x)*(miny-p0.y) - (p1.y-p0.y)*(minx-p0.x);
	
	w0x = (p2.y-p1.y);
	w0y = (p2.x-p1.x);
	w1x = (p0.y-p2.y);
	w1y = (p0.x-p2.x);
	w2x = (p1.y-p0.y);
	w2y = (p1.x-p0.x);
	for(y = miny;y <= maxy;y++) {
		u = uinv; 
		v = vinv; 
		w0 = w0i; 
		w1 = w1i; 
		w2 = w2i;
		for(x = minx;x <= maxx;x++) {
			if(x>=0 && x<160 && y>=0 && y<120) {	
				if((w0 >= 0) && (w1 >= 0) && (w2 >= 0)) { 
					uint8_t ui,vi,p; 
					ui = u>>16; 
					vi = v>>16; 
					p = texture->data[(vi&0x0F)*16 + (ui&0x0F)]; 
					canvas->data[y*160 + x] = p; 
				} 
			}
			u += dudx; 
			v += dvdx;
			w0 -= w0x;
			w1 -= w1x;
			w2 -= w2x;
		} 
		uinv += dudy;
		vinv += dvdy;
		w0i += w0y;
		w1i += w1y;
		w2i += w2y;
	} 
	
} 
*/