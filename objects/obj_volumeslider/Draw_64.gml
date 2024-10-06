if (g.alien != -1) {
	exit
}

draw_set_color(#FFFFFF);

draw_set_alpha(0.75);
draw_rectangle(675, 480, 900, 510, true);

draw_set_alpha(0.25);
draw_rectangle(677, 482, 677 + 221, 508, false);

draw_set_alpha(0.75);
draw_rectangle(677, 482, 677 + (221 * g.vol), 508, false);

draw_set_color(#FFFFFF);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_font(fnt_font);
draw_set_alpha(1);

draw_set_color(#10121C);
draw_text_transformed(780, 482, "VOLUME: " + string(round(g.vol * 100)) + "%", 0.6, 0.6, 0);
draw_set_color(#FFFFFF);
draw_text_transformed(781, 483, "VOLUME: " + string(round(g.vol * 100)) + "%", 0.6, 0.6, 0);