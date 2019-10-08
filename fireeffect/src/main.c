/*
 *--------------------------------------
 * Program Name: Fire Effect
 * Author: Zaalane
 * License:
 * Description: Test Implementation of the Demoscene fire effect
 *--------------------------------------
*/

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

#include "gfx/palette.h" 
void refresh(void); 
void tick(void); 

#define W 40 
#define H 30

extern gfx_sprite_t screen;
extern uint8_t buf1[H][W]; 
uint8_t buf2[H][W];

void main() {	
	int i; 
	srandom(rtc_Time()); 
	
    gfx_Begin();
	gfx_SetPalette(palette_pal,sizeof_palette_pal,0); 
	gfx_SetColor(0xFF); 
	gfx_ZeroScreen(); 
    gfx_SetDrawBuffer(); 
	
	kb_Scan();
	 
	while(!(kb_Data[6] & kb_Clear)) {	
		tick();
		gfx_ZeroScreen();
		gfx_ScaledSprite_NoClip(&screen,0,0,8,8); 
		gfx_SwapDraw(); 
		refresh();
		
		kb_Scan(); 
	} 
    gfx_End();
}

void refresh() { 
	int x;
	for(x = 0; x < W; x++) {
		buf1[H-1][x] = randInt(0,32);
	} 
} 

void tick() {

	int x,y; 
	int lastline; 
	
	for(y = H-2; y >= 0; y--) { 
		lastline = 0; 
		for(x = W-1; x >= 0;x--) { 
			uint8_t sum;
			uint8_t b; 
			switch(y) { 
				case H-2: 
					b = 0; 
					break; 
				default: 
					b = buf1[y+2][x]; 
					break;
			} 
			switch(x) { 
				case 0: 
					sum = buf1[y+1][x] + buf1[y+1][x+1] + b;
					buf2[y][x] = (sum*63) / 200;
					break; 
				case W-1: 
					sum = buf1[y+1][x] + buf1[y+1][x-1] + b;
					buf2[y][x] = (sum*63) / 200;
					break;
				default: 
					sum = buf1[y+1][x] + buf1[y+1][x+1] + buf1[y+1][x-1] + b;
					buf2[y][x] = (sum*47) / 200;
					break;
			} 
			
			lastline += buf2[y][x]; 
		}
		if ( lastline < 10 ) { 
			memset(buf2,0,y*W); 
			break;
		} 
	}
	
	memcpy(buf1,buf2,W*H);
	
} 

