// convpng v7.2
// this file contains all the graphics sources for easy inclusion in a project
#ifndef __palette__
#define __palette__
#include <stdint.h>

#define Image1_width 40
#define Image1_height 30
#define Image1_size 1202
extern uint8_t Image1_data[1200];
#define Image1 ((gfx_sprite_t*)Image1_data)
#define sizeof_palette_pal 512
extern uint16_t palette_pal[256];

#endif
