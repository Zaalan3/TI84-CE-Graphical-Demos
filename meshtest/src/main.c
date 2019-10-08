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

#include "gfx/tiles.h" 
#include "mesh.h" 
 

vertex_t vert[16] =
{ 
	{-8,-24},{8,-24},
	{-24,-10},{-8,-8},{8,-8},{24,-10}, 
	{-24,10},{-8,8},{8,8},{24,10}, 
	{-8,24},{8,24},
	{-10,40},{10,40},
	{-10,-32},{10,-32}
}; 

face_t face[7] =
{ 
	{14,15,1,0,wood_data+2},
	{0,1,4,3,wood_data+2},
	{2,3,7,6,wood_data+2},
	{3,4,8,7,wood_data+2},
	{4,5,9,8,wood_data+2},
	{7,8,11,10,wood_data+2},
	{10,11,13,12,wood_data+2}
}; 

mesh_t cross = {vert,face,16,7}; 

	
void main(void) {
	uint8_t scale = 8; 
	uint8_t angle = 0;  
    gfx_Begin();
	gfx_SetPalette(tiles_pal,sizeof_tiles_pal,0);
	gfx_SetTextBGColor(0);	
	gfx_SetTextFGColor(0x0F);
    gfx_ZeroScreen();
    gfx_SetDrawBuffer();
	initMesh();  
L1:     	
	while(!(os_GetCSC())){ 	
		gfx_ZeroScreen();
		drawMesh(cross,angle,160,120,scale);
		gfx_SwapDraw();
		angle+=4;   
	}
	if(--scale >= 6) goto L1; 
    gfx_End();
	endMesh(); 
}
 