/*
 *--------------------------------------
 * Program Name: Game of Life
 * Author: Zaalane
 * License:
 * Description: Test Implementation of the Game of Life
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

void randomize(void); 
void tick(void); 

#define W 40 
#define H 30

extern gfx_sprite_t screen;
extern uint8_t buf1[H][W]; 
uint8_t buf2[H][W]; 

#define DENSITY 15

#define COLOR_ALIVE 0xFF
#define COLOR_BORN  0x87
#define COLOR_DEAD  0x00
#define COLOR_DIED  0xC0

#define UNDER_POP 1
#define OVER_POP 4
#define BIRTH_POP 3

void main() {	
	int i; 
	srandom(rtc_Time()); 
	
    gfx_Begin();
	gfx_ZeroScreen(); 
    gfx_SetDrawBuffer(); 
	
	randomize();
	
	kb_Scan();
	while(!(kb_Data[6] & kb_Clear)) {
		gfx_ZeroScreen();
		gfx_ScaledSprite_NoClip(&screen,0,0,8,8);	
		gfx_SwapDraw(); 
		
		tick();
		
		kb_Scan(); 
	} 
    gfx_End();
}

void randomize() { 
	int x,y;
	for(x = 0; x < W; x++) { 
		for(y = 0; y < H;y++) { 
			if ( randInt(0,99) < DENSITY )  
				buf1[y][x] = 0xFF; 
			else 
				buf1[y][x] = 0;
		}
	}
} 

void tick() {
	
	int i,j; 
	int x,y; 
	int imin,imax,jmin,jmax;
	
	for(x = 0; x < W; x++) {
		
		switch(x) { 
			case 0: 
				imin = 0;
				imax = 1;
				break; 
			case 39: 
				imin = -1;
				imax = 0;
				break;
			default: 
				imin = -1;
				imax = 1;
				break;
		}
		
		for(y = 0; y < H;y++) { 
			int living = 0; 
			 
			switch(y) { 
				case 0: 
					jmin = 0;
					jmax = 1;
					break; 
				case 29: 
					jmin = -1;
					jmax = 0;
					break;
				default: 
					jmin = -1;
					jmax = 1;
					break;
			} 
			
			for (i = imin; i <= imax; i++ ) {
				for(j = jmin; j <= jmax; j++) {
					if((buf1[y+j][x+i]==COLOR_ALIVE || buf1[y+j][x+i]==COLOR_BORN) && !(i==0 && j==0))
						living++;
				}	
			}
			
			if((buf1[y][x]==COLOR_ALIVE || buf1[y][x]==COLOR_BORN)) { 
				if(living <= UNDER_POP || living >= OVER_POP)
					buf2[y][x] = COLOR_DIED; 
				else 
					buf2[y][x] = COLOR_ALIVE;
			} 
			else 
			{ 
				if( living == BIRTH_POP ) 
					buf2[y][x] = COLOR_BORN;
				else 
					buf2[y][x] = COLOR_DEAD;
			} 
			
		}
	}
	
	memcpy(buf1,buf2,W*H);
	
} 

