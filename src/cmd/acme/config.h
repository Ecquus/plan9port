#include <u.h>

#ifndef CONFIG_H
#define CONFIG_H

typedef struct ColorScheme {
	int32 tag_bg;
	int32 tag_fg;
	int32 tag_hlbg;
	int32 tag_hlfg;
	int32 text_bg;
	int32 text_fg;
	int32 text_hlbg;
	int32 text_hlfg;
	int32 win_button;
	int32 col_button;
	int32 tmp_button;
	int32 scroll_bg;
	int32 button2_hl;
	int32 button3_hl;
} ColorScheme;

enum {
	LightColorScheme,
	DarkColorScheme,
};

extern ColorScheme colorschemes[2];
extern int current_colorscheme;

#endif  /* CONFIG_H */
