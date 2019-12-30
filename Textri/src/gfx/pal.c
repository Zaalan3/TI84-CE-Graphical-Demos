// convpng v7.2
#include <stdint.h>
#include "pal.h"

uint16_t pal_pal[256] = {
 0x0000,  // 00 :: rgb(0,0,0)
 0x000D,  // 01 :: rgb(0,0,104)
 0x0016,  // 02 :: rgb(0,0,183)
 0x001F,  // 03 :: rgb(0,0,255)
 0x1800,  // 04 :: rgb(51,0,0)
 0x180D,  // 05 :: rgb(51,0,104)
 0x1816,  // 06 :: rgb(51,0,183)
 0x181F,  // 07 :: rgb(51,0,255)
 0x2C00,  // 08 :: rgb(92,0,0)
 0x2C0D,  // 09 :: rgb(92,0,104)
 0x2C16,  // 10 :: rgb(92,0,183)
 0x2C1F,  // 11 :: rgb(92,0,255)
 0x3C00,  // 12 :: rgb(127,0,0)
 0x3C0D,  // 13 :: rgb(127,0,104)
 0x3C16,  // 14 :: rgb(127,0,183)
 0x3C1F,  // 15 :: rgb(127,0,255)
 0x5000,  // 16 :: rgb(162,0,0)
 0x500D,  // 17 :: rgb(162,0,104)
 0x5016,  // 18 :: rgb(162,0,183)
 0x501F,  // 19 :: rgb(162,0,255)
 0x5C00,  // 20 :: rgb(193,0,0)
 0x5C0D,  // 21 :: rgb(193,0,104)
 0x5C16,  // 22 :: rgb(193,0,183)
 0x5C1F,  // 23 :: rgb(193,0,255)
 0x6C00,  // 24 :: rgb(225,0,0)
 0x6C0D,  // 25 :: rgb(225,0,104)
 0x6C16,  // 26 :: rgb(225,0,183)
 0x6C1F,  // 27 :: rgb(225,0,255)
 0x7C00,  // 28 :: rgb(255,0,0)
 0x7C0D,  // 29 :: rgb(255,0,104)
 0x7C16,  // 30 :: rgb(255,0,183)
 0x7C1F,  // 31 :: rgb(255,0,255)
 0x80C0,  // 32 :: rgb(0,51,0)
 0x80CD,  // 33 :: rgb(0,51,104)
 0x80D6,  // 34 :: rgb(0,51,183)
 0x80DF,  // 35 :: rgb(0,51,255)
 0x98C0,  // 36 :: rgb(51,51,0)
 0x98CD,  // 37 :: rgb(51,51,104)
 0x98D6,  // 38 :: rgb(51,51,183)
 0x98DF,  // 39 :: rgb(51,51,255)
 0xACC0,  // 40 :: rgb(92,51,0)
 0xACCD,  // 41 :: rgb(92,51,104)
 0xACD6,  // 42 :: rgb(92,51,183)
 0xACDF,  // 43 :: rgb(92,51,255)
 0xBCC0,  // 44 :: rgb(127,51,0)
 0xBCCD,  // 45 :: rgb(127,51,104)
 0xBCD6,  // 46 :: rgb(127,51,183)
 0xBCDF,  // 47 :: rgb(127,51,255)
 0xD0C0,  // 48 :: rgb(162,51,0)
 0xD0CD,  // 49 :: rgb(162,51,104)
 0xD0D6,  // 50 :: rgb(162,51,183)
 0xD0DF,  // 51 :: rgb(162,51,255)
 0xDCC0,  // 52 :: rgb(193,51,0)
 0xDCCD,  // 53 :: rgb(193,51,104)
 0xDCD6,  // 54 :: rgb(193,51,183)
 0xDCDF,  // 55 :: rgb(193,51,255)
 0xECC0,  // 56 :: rgb(225,51,0)
 0xECCD,  // 57 :: rgb(225,51,104)
 0xECD6,  // 58 :: rgb(225,51,183)
 0xECDF,  // 59 :: rgb(225,51,255)
 0xFCC0,  // 60 :: rgb(255,51,0)
 0xFCCD,  // 61 :: rgb(255,51,104)
 0xFCD6,  // 62 :: rgb(255,51,183)
 0xFCDF,  // 63 :: rgb(255,51,255)
 0x8160,  // 64 :: rgb(0,92,0)
 0x816D,  // 65 :: rgb(0,92,104)
 0x8176,  // 66 :: rgb(0,92,183)
 0x817F,  // 67 :: rgb(0,92,255)
 0x9960,  // 68 :: rgb(51,92,0)
 0x996D,  // 69 :: rgb(51,92,104)
 0x9976,  // 70 :: rgb(51,92,183)
 0x997F,  // 71 :: rgb(51,92,255)
 0xAD60,  // 72 :: rgb(92,92,0)
 0xAD6D,  // 73 :: rgb(92,92,104)
 0xAD76,  // 74 :: rgb(92,92,183)
 0xAD7F,  // 75 :: rgb(92,92,255)
 0xBD60,  // 76 :: rgb(127,92,0)
 0xBD6D,  // 77 :: rgb(127,92,104)
 0xBD76,  // 78 :: rgb(127,92,183)
 0xBD7F,  // 79 :: rgb(127,92,255)
 0xD160,  // 80 :: rgb(162,92,0)
 0xD16D,  // 81 :: rgb(162,92,104)
 0xD176,  // 82 :: rgb(162,92,183)
 0xD17F,  // 83 :: rgb(162,92,255)
 0xDD60,  // 84 :: rgb(193,92,0)
 0xDD6D,  // 85 :: rgb(193,92,104)
 0xDD76,  // 86 :: rgb(193,92,183)
 0xDD7F,  // 87 :: rgb(193,92,255)
 0xED60,  // 88 :: rgb(225,92,0)
 0xED6D,  // 89 :: rgb(225,92,104)
 0xED76,  // 90 :: rgb(225,92,183)
 0xED7F,  // 91 :: rgb(225,92,255)
 0xFD60,  // 92 :: rgb(255,92,0)
 0xFD6D,  // 93 :: rgb(255,92,104)
 0xFD76,  // 94 :: rgb(255,92,183)
 0xFD7F,  // 95 :: rgb(255,92,255)
 0x81E0,  // 96 :: rgb(0,127,0)
 0x81ED,  // 97 :: rgb(0,127,104)
 0x81F6,  // 98 :: rgb(0,127,183)
 0x81FF,  // 99 :: rgb(0,127,255)
 0x99E0,  // 100 :: rgb(51,127,0)
 0x99ED,  // 101 :: rgb(51,127,104)
 0x99F6,  // 102 :: rgb(51,127,183)
 0x99FF,  // 103 :: rgb(51,127,255)
 0xADE0,  // 104 :: rgb(92,127,0)
 0xADED,  // 105 :: rgb(92,127,104)
 0xADF6,  // 106 :: rgb(92,127,183)
 0xADFF,  // 107 :: rgb(92,127,255)
 0xBDE0,  // 108 :: rgb(127,127,0)
 0xBDED,  // 109 :: rgb(127,127,104)
 0xBDF6,  // 110 :: rgb(127,127,183)
 0xBDFF,  // 111 :: rgb(127,127,255)
 0xD1E0,  // 112 :: rgb(162,127,0)
 0xD1ED,  // 113 :: rgb(162,127,104)
 0xD1F6,  // 114 :: rgb(162,127,183)
 0xD1FF,  // 115 :: rgb(162,127,255)
 0xDDE0,  // 116 :: rgb(193,127,0)
 0xDDED,  // 117 :: rgb(193,127,104)
 0xDDF6,  // 118 :: rgb(193,127,183)
 0xDDFF,  // 119 :: rgb(193,127,255)
 0xEDE0,  // 120 :: rgb(225,127,0)
 0xEDED,  // 121 :: rgb(225,127,104)
 0xEDF6,  // 122 :: rgb(225,127,183)
 0xEDFF,  // 123 :: rgb(225,127,255)
 0xFDE0,  // 124 :: rgb(255,127,0)
 0xFDED,  // 125 :: rgb(255,127,104)
 0xFDF6,  // 126 :: rgb(255,127,183)
 0xFDFF,  // 127 :: rgb(255,127,255)
 0x0280,  // 128 :: rgb(0,162,0)
 0x028D,  // 129 :: rgb(0,162,104)
 0x0296,  // 130 :: rgb(0,162,183)
 0x029F,  // 131 :: rgb(0,162,255)
 0x1A80,  // 132 :: rgb(51,162,0)
 0x1A8D,  // 133 :: rgb(51,162,104)
 0x1A96,  // 134 :: rgb(51,162,183)
 0x1A9F,  // 135 :: rgb(51,162,255)
 0x2E80,  // 136 :: rgb(92,162,0)
 0x2E8D,  // 137 :: rgb(92,162,104)
 0x2E96,  // 138 :: rgb(92,162,183)
 0x2E9F,  // 139 :: rgb(92,162,255)
 0x3E80,  // 140 :: rgb(127,162,0)
 0x3E8D,  // 141 :: rgb(127,162,104)
 0x3E96,  // 142 :: rgb(127,162,183)
 0x3E9F,  // 143 :: rgb(127,162,255)
 0x5280,  // 144 :: rgb(162,162,0)
 0x528D,  // 145 :: rgb(162,162,104)
 0x5296,  // 146 :: rgb(162,162,183)
 0x529F,  // 147 :: rgb(162,162,255)
 0x5E80,  // 148 :: rgb(193,162,0)
 0x5E8D,  // 149 :: rgb(193,162,104)
 0x5E96,  // 150 :: rgb(193,162,183)
 0x5E9F,  // 151 :: rgb(193,162,255)
 0x6E80,  // 152 :: rgb(225,162,0)
 0x6E8D,  // 153 :: rgb(225,162,104)
 0x6E96,  // 154 :: rgb(225,162,183)
 0x6E9F,  // 155 :: rgb(225,162,255)
 0x7E80,  // 156 :: rgb(255,162,0)
 0x7E8D,  // 157 :: rgb(255,162,104)
 0x7E96,  // 158 :: rgb(255,162,183)
 0x7E9F,  // 159 :: rgb(255,162,255)
 0x0300,  // 160 :: rgb(0,193,0)
 0x030D,  // 161 :: rgb(0,193,104)
 0x0316,  // 162 :: rgb(0,193,183)
 0x031F,  // 163 :: rgb(0,193,255)
 0x1B00,  // 164 :: rgb(51,193,0)
 0x1B0D,  // 165 :: rgb(51,193,104)
 0x1B16,  // 166 :: rgb(51,193,183)
 0x1B1F,  // 167 :: rgb(51,193,255)
 0x2F00,  // 168 :: rgb(92,193,0)
 0x2F0D,  // 169 :: rgb(92,193,104)
 0x2F16,  // 170 :: rgb(92,193,183)
 0x2F1F,  // 171 :: rgb(92,193,255)
 0x3F00,  // 172 :: rgb(127,193,0)
 0x3F0D,  // 173 :: rgb(127,193,104)
 0x3F16,  // 174 :: rgb(127,193,183)
 0x3F1F,  // 175 :: rgb(127,193,255)
 0x5300,  // 176 :: rgb(162,193,0)
 0x530D,  // 177 :: rgb(162,193,104)
 0x5316,  // 178 :: rgb(162,193,183)
 0x531F,  // 179 :: rgb(162,193,255)
 0x5F00,  // 180 :: rgb(193,193,0)
 0x5F0D,  // 181 :: rgb(193,193,104)
 0x5F16,  // 182 :: rgb(193,193,183)
 0x5F1F,  // 183 :: rgb(193,193,255)
 0x6F00,  // 184 :: rgb(225,193,0)
 0x6F0D,  // 185 :: rgb(225,193,104)
 0x6F16,  // 186 :: rgb(225,193,183)
 0x6F1F,  // 187 :: rgb(225,193,255)
 0x7F00,  // 188 :: rgb(255,193,0)
 0x7F0D,  // 189 :: rgb(255,193,104)
 0x7F16,  // 190 :: rgb(255,193,183)
 0x7F1F,  // 191 :: rgb(255,193,255)
 0x0380,  // 192 :: rgb(0,225,0)
 0x138D,  // 193 :: rgb(32,225,104)
 0x0396,  // 194 :: rgb(0,225,183)
 0x039F,  // 195 :: rgb(0,225,255)
 0x1B80,  // 196 :: rgb(51,225,0)
 0x1B8D,  // 197 :: rgb(51,225,104)
 0x1B96,  // 198 :: rgb(51,225,183)
 0x1B9F,  // 199 :: rgb(51,225,255)
 0x2F80,  // 200 :: rgb(92,225,0)
 0x2F8D,  // 201 :: rgb(92,225,104)
 0x2F96,  // 202 :: rgb(92,225,183)
 0x2F9F,  // 203 :: rgb(92,225,255)
 0x3F80,  // 204 :: rgb(127,225,0)
 0x3F8D,  // 205 :: rgb(127,225,104)
 0x3F96,  // 206 :: rgb(127,225,183)
 0x3F9F,  // 207 :: rgb(127,225,255)
 0x5380,  // 208 :: rgb(162,225,0)
 0x538D,  // 209 :: rgb(162,225,104)
 0x5396,  // 210 :: rgb(162,225,183)
 0x539F,  // 211 :: rgb(162,225,255)
 0x5F80,  // 212 :: rgb(193,225,0)
 0x5F8D,  // 213 :: rgb(193,225,104)
 0x5F96,  // 214 :: rgb(193,225,183)
 0x5F9F,  // 215 :: rgb(193,225,255)
 0x6F80,  // 216 :: rgb(225,225,0)
 0x6F8D,  // 217 :: rgb(225,225,104)
 0x6F96,  // 218 :: rgb(225,225,183)
 0x6F9F,  // 219 :: rgb(225,225,255)
 0x7F80,  // 220 :: rgb(255,225,0)
 0x7F8D,  // 221 :: rgb(255,225,104)
 0x7F96,  // 222 :: rgb(255,225,183)
 0x7F9F,  // 223 :: rgb(255,225,255)
 0x83E0,  // 224 :: rgb(0,255,0)
 0x83ED,  // 225 :: rgb(0,255,104)
 0x83F6,  // 226 :: rgb(0,255,183)
 0x83FF,  // 227 :: rgb(0,255,255)
 0x9BE0,  // 228 :: rgb(51,255,0)
 0x9BED,  // 229 :: rgb(51,255,104)
 0x9BF6,  // 230 :: rgb(51,255,183)
 0x9BFF,  // 231 :: rgb(51,255,255)
 0xAFE0,  // 232 :: rgb(92,255,0)
 0xAFED,  // 233 :: rgb(92,255,104)
 0xAFF6,  // 234 :: rgb(92,255,183)
 0xAFFF,  // 235 :: rgb(92,255,255)
 0xBFE0,  // 236 :: rgb(127,255,0)
 0xBFED,  // 237 :: rgb(127,255,104)
 0xBFF6,  // 238 :: rgb(127,255,183)
 0xBFFF,  // 239 :: rgb(127,255,255)
 0xD3E0,  // 240 :: rgb(162,255,0)
 0xD3ED,  // 241 :: rgb(162,255,104)
 0xD3F6,  // 242 :: rgb(162,255,183)
 0xD3FF,  // 243 :: rgb(162,255,255)
 0xDFE0,  // 244 :: rgb(193,255,0)
 0xDFED,  // 245 :: rgb(193,255,104)
 0xDFF6,  // 246 :: rgb(193,255,183)
 0xDFFF,  // 247 :: rgb(193,255,255)
 0xEFE0,  // 248 :: rgb(225,255,0)
 0xEFED,  // 249 :: rgb(225,255,104)
 0xEFF6,  // 250 :: rgb(225,255,183)
 0xEFFF,  // 251 :: rgb(225,255,255)
 0xFFE0,  // 252 :: rgb(255,255,0)
 0xFFED,  // 253 :: rgb(255,255,104)
 0xFFF6,  // 254 :: rgb(255,255,183)
 0xFFFF,  // 255 :: rgb(255,255,255)
};
