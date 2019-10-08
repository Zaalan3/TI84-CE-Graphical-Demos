#ifndef MESH_H 
#define MESH_H 

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <tice.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct { 
	int8_t x; 
	int8_t y; 
} vertex_t; 

typedef struct { 
	uint8_t v0;// vertexes of face in clockwise order
	uint8_t v1;
	uint8_t v2;
	uint8_t v3;	
	uint8_t* texture; 
} face_t; 

typedef struct { 
	vertex_t* verts; 
	face_t* faces; 
	uint8_t vertnum; 
	uint8_t facenum; 
} mesh_t; 
	
void initMesh(void); 

void endMesh(void); 

void drawMesh(mesh_t mesh,uint8_t angle,uint8_t x,uint8_t y,uint8_t scale); 

	
	
#endif 