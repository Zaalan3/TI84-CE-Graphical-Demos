// convpng v7.1
// this file contains all the graphics sources for easy inclusion in a project
#ifndef __tiles__
#define __tiles__
#include <stdint.h>

#define wood_width 16
#define wood_height 16
#define wood_size 258
extern uint8_t wood_data[258];
#define wood ((gfx_sprite_t*)wood_data)
#define stone_width 16
#define stone_height 16
#define stone_size 258
extern uint8_t stone_data[258];
#define stone ((gfx_sprite_t*)stone_data)
#define ship_width 16
#define ship_height 16
#define ship_size 258
extern uint8_t ship_data[258];
#define ship ((gfx_sprite_t*)ship_data)
#define sizeof_tiles_pal 32
extern uint16_t tiles_pal[16];

#endif
