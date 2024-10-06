if (g.alien != -1) {
	exit
}

var _mx = display_mouse_get_x();
var _my = display_mouse_get_y();

if ((_mx >= 675 && _mx <= 900 && _my >= 480 && _my <= 510) || sliding) {
	if (!sliding && mouse_check_button_pressed(mb_left)) {
		sliding = true;
	} else if (sliding && mouse_check_button_released(mb_left)) {
		sliding = false;
	}
	if (sliding) {
		g.vol -= (g.vol - ((_mx - 675) / 225)) / 4;
		g.vol = median(0, g.vol, 1);
		audio_master_gain(g.vol);
	}
}