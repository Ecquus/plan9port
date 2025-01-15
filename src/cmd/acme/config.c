#include "config.h"

const ColorScheme acme2k_dark = {
	0x333333FF,  /* tag_bg */
	0xBBBBBBFF,  /* tag_fg */
	0xB294BBFF,  /* tag_hlfg */
	0x353651FF,  /* tag_hlbg */
	0x1D1F21FF,  /* text_bg */
	0xDDDDDDFF,  /* text_fg */
	0xB294BBFF,  /* text_hlbg */
	0x353651FF,  /* text_hlfg */
	0xAA4465FF,  /* win_button */
	0x436763FF,  /* col_button */
	0x436763FF,  /* tmp_button */
	0x363636FF,  /* scroll_bg */
	0x55AAAAFF,  /* button2_hl */
	0x55AAAAFF,  /* button3_hl */
};

const ColorScheme henna = {
	0x191A1FFF,  /* tag_bg */
	0x1CAF8AFF,  /* tag_fg */
	0x20272FFF,  /* tag_hlbg */
	0xD0D0C8FF,  /* tag_hlfg */
	0x20272FFF,  /* text_bg */
	0xE4E4D9FF,  /* text_fg */
	0x3F5A62FF,  /* text_hlbg */
	0xFFFFF8FF,  /* text_hlfg */
	0xE84C3DFF,  /* win_button */
	0x1CAF8AFF,  /* col_button */
	0x1CAF8AFF,  /* tmp_button */
	0x191A1FFF,  /* scroll_bg */
	0xE84C3DFF,  /* button2_hl */
	0x1CAF8AFF,  /* button3_hl */
};

const ColorScheme wilmersdorf = {
	0x1F2024FF,  /* tag_bg */
	0xABABABFF,  /* tag_fg */
	0x61656BFF,  /* tag_hlbg */
	0xE0E0E0FF,  /* tag_hlfg */
	0x282B33FF,  /* text_bg */
	0xC6C6C6FF,  /* text_fg */
	0x61656BFF,  /* text_hlbg */
	0xE0E0E0FF,  /* text_hlfg */
	0x505870FF,  /* win_button */
	0x646d8bFF,  /* col_button */
	0x6E7899FF,  /* tmp_button */
	0x1F2024FF,  /* scroll_bg */
	0xAA0000FF,  /* button2_hl */
	0x006600FF,  /* button3_hl */
};

const ColorScheme noir = {
	0x000000FF,  /* tag_bg */
	0x8A8A8AFF,  /* tag_fg */
	0x585858FF,  /* tag_hlbg */
	0xDCDCDCFF,  /* tag_hlfg */
	0x000000FF,  /* text_bg */
	0xBCBCBCFF,  /* text_fg */
	0x585858FF,  /* text_hlbg */
	0xDCDCDCFF,  /* text_hlfg */
	0x707070FF,  /* win_button */
	0x585858FF,  /* col_button */
	0xBCBCBCFF,  /* tmp_button */
	0x464646FF,  /* scroll_bg */
	0xAA0000FF,  /* button2_hl */
	0x006600FF,  /* button3_hl */
};

const ColorScheme xoria256 = {
	0xBCBCBCFF,  /* tag_bg */
	0x000000FF,  /* tag_fg */
	0x5F5F87FF,  /* tag_hlbg */
	0xBCBCBCFF,  /* tag_hlfg */
	0x000000FF,  /* text_bg */
	0xBCBCBCFF,  /* text_fg */
	0x5F5F87FF,  /* text_hlbg */
	0xBCBCBCFF,  /* text_hlfg */
	0xD7AFAFFF,  /* win_button */
	0x5F5F87FF,  /* col_button */
	0xBCBCBCFF,  /* tmp_button */
	0x464646FF,  /* scroll_bg */
	0xAA0000FF,  /* button2_hl */
	0x006600FF,  /* button3_hl */
};

const ColorScheme acme_default = {
	0xEAFFFFFF,  /* tag_bg */
	0x000000FF,  /* tag_fg */
	0x9EEEEEFF,  /* tag_hlbg */
	0x000000FF,  /* tag_hlfg */
	0xFFFFEAFF,  /* text_bg */
	0x000000FF,  /* text_fg */
	0xEEEE9EFF,  /* text_hlbg */
	0x000000FF,  /* text_hlfg */
	0x8888CCFF,  /* win_button */
	0x8888CCFF,  /* col_button */
	0x000099FF,  /* tmp_button */
	0x99994CFF,  /* scroll_bg */
	0xAA0000FF,  /* button2_hl */
	0x006600FF,  /* button3_hl */
};

ColorScheme colorschemes[2] = {
	acme_default, /* LightColorScheme */
	acme2k_dark, /* DarkColorScheme */
};

int current_colorscheme = LightColorScheme;