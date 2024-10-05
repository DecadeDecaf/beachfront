if (position_meeting(mouse_x, mouse_y, id)) {
	if (mouse_check_button_pressed(mb_left)) {
		sprite_index = spr_alien_dragged;
		dragged = true;
		task = "...";
		g.alien = id;
		alarm[0] = -1;
		alarm[1] = -1;
		audio_play_sound(sfx_lift, 0, false);
		audio_play_sound(sfx_dragged, 1, false);
	}
}

if (dragged) {
	if (mouse_check_button_released(mb_left)) {
		sprite_index = spr_alien;
		dragged = false;
		alarm[0] = 80;
		audio_stop_sound(sfx_dragged);
		audio_play_sound(sfx_drop, 0, false);
	} else {
		var _mx = median(60, mouse_x, 1860);
		var _my = median(60, mouse_y, 1020);
		x -= (x - _mx) / 8;
		y -= (y - _my) / 8;
	}
}

if (tfc % 60 == 59) {
	if (task == "Taking a leak") {
		potty++;
	}
}

if (tfc % 120 == 119) {
	if (task == "Drinking saltwater") {
		food--;
		potty--;
	}
}

if (tfc % 300 == 299) {
	if (task == "Sunbathing") {
		energy++;
	} else if (task == "Splashing around") {
		mood++;
		energy--;
	} else if (task == "Digging for cash") {
		g.sanddollars += choose(1, 1, 2);
		energy--;
	}
}

if (nfc % 3600 == 3599) {
	mood--;
	energy--;
	potty--;
	food--;
}

mood = median(1, mood, 6);
energy = median(1, energy, 6);
potty = median(1, potty, 6);
food = median(1, food, 6);