draw_set_color(#10121C);
draw_set_alpha(0.2);
draw_ellipse(x - 20, y - 12, x + 20, y + 4, false);
draw_set_alpha(1);

if (g.alien == id) {
	var _dis = (dragged ? 4 : 2.5);
	gpu_set_fog(true, #FFFFFF, 1, 1);
	for (var _ang = 0; _ang < 360; _ang += 30) {
		var _x = x + lengthdir_x(_dis, _ang);
		var _y = y + lengthdir_y(_dis, _ang);
		draw_sprite_ext(sprite_index, image_index, _x, _y, 1, 1, 0, -1, 0.25);
	}
	gpu_set_fog(false, #000000, 0, 0);
}

draw_self();