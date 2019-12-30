// convpng v7.2
// this file contains all the graphics sources for easy inclusion in a project
#ifndef __tileset__
#define __tileset__
#include <stdint.h>

extern uint8_t tileset_tile_0_data[];
#define tileset_tile_0 ((gfx_sprite_t*)tileset_tile_0_data)
extern uint8_t tileset_tile_1_data[];
#define tileset_tile_1 ((gfx_sprite_t*)tileset_tile_1_data)
#define tileset_tiles_num 2
extern uint8_t *tileset_tiles_data[2];
#define tileset_tiles ((gfx_sprite_t**)tileset_tiles_data)

#endif
