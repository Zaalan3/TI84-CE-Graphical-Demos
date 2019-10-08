
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <tice.h>

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mesh.h" 

#define x0 (x + tverts[mesh.faces[i].v0].x)
#define y0 (y + tverts[mesh.faces[i].v0].y) 
#define x1 (x + tverts[mesh.faces[i].v1].x)
#define y1 (y + tverts[mesh.faces[i].v1].y)
#define x2 (x + tverts[mesh.faces[i].v2].x)
#define y2 (y + tverts[mesh.faces[i].v2].y)
#define x3 (x + tverts[mesh.faces[i].v3].x)
#define y3 (y + tverts[mesh.faces[i].v3].y)

static vertex_t* tverts; 
static int8_t sintable[256]; 
void bilerpInit(void);

// (x0,y0) - (x3,y3) : points of quadrilateral in clockwise order 
// texture: pointer to 16x16 texture data
static void (*bilerp)(int24_t,int24_t,int24_t,int24_t,int24_t,int24_t,int24_t,int24_t,uint8_t*) = 
	(void (*)(int24_t,int24_t,int24_t,int24_t,int24_t,int24_t,int24_t,int24_t,uint8_t*))0xE30A00;
 
void initMesh(void) { 
	uint16_t i; 
	bilerpInit(); 
	tverts = malloc(64*sizeof(vertex_t));
	for(i = 0; i < 256; i++) { 
		sintable[i] = 127.9999*sin(i*(M_PI/128.0)); 
	} 
} 

void endMesh(void) { 
	free(tverts); 
} 
	
void drawMesh(mesh_t mesh,uint8_t angle,uint8_t x,uint8_t y,uint8_t scale) {
	uint8_t i; 
	int8_t s = sintable[angle]; 
	int8_t c = sintable[(angle+64)%256];
	//translate vertices
	for(i = 0; i<mesh.vertnum;i++) { 
		tverts[i].x = (mesh.verts[i].x*c - mesh.verts[i].y*s)>>scale; 
		tverts[i].y = (mesh.verts[i].x*s + mesh.verts[i].y*c)>>scale; 
	} 	
	// draw faces 
	for( i = 0; i<mesh.facenum;i++ ) { 
		bilerp(x0,x1,x2,x3,y0,y1,y2,y3,mesh.faces[i].texture); 
	}
} 


	