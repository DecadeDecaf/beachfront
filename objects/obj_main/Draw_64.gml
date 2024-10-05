if (g.alien != -1) {
	var _alien = g.alien;
	draw_sprite(spr_overlay, 0, 0, 0);
	draw_sprite(spr_stat_mood, _alien.mood - 1, 0, 0);
	draw_sprite(spr_stat_energy, _alien.energy - 1, 0, 0);
	draw_sprite(spr_stat_potty, _alien.potty - 1, 0, 0);
	draw_sprite(spr_stat_food, _alien.food - 1, 0, 0);
	draw_set_font(fnt_font);
	draw_set_color(#10121C);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	var _size = 0.85;
	var _yoff = 0;
	while (string_width(_alien.firstname) * _size > 160) {
		_size -= 0.025;
		_yoff += 0.5;
		
	}
	draw_text_transformed(160, 536 - _yoff, _alien.firstname, _size, _size, 0);
	_size = 0.85;
	_yoff = 0;
	while (string_width(_alien.task) * _size > 150) {
		_size -= 0.025;
		_yoff += 0.5;
		
	}
	draw_text_transformed(375, 535 - _yoff, _alien.task, _size, _size, 0);
	draw_text_transformed(606, 535, g.sanddollars, 0.8, 0.8, 0);
}