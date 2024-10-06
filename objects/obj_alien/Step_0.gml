depth = ceil(-y / 10);

var _already_dragging = false;

with (obj_alien) {
	if (dragged) {
		_already_dragging = true;
	}
}

if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) && !_already_dragging) {
	g.alien = id;
	dragged = true;
	dragging = 0;
}

if (dragged) {
	dragging++;
	if (dragging == 12) {
		if (task != "Dead") {
			sprite_index = spr_alien_dragged;
			image_xscale = 1;
			task = "...";
			alarm[0] = -1;
			alarm[1] = -1;
			audio_play_sound(sfx_dragged, 1, false);
		}
		audio_play_sound(sfx_lift, 0, false);
	}
	if (dragging >= 12) {
		if (mouse_check_button_released(mb_left)) {
			dragged = false;
			if (task != "Dead") {
				sprite_index = spr_alien;
				alarm[0] = 80;
				audio_stop_sound(sfx_dragged);
			}
			audio_play_sound(sfx_drop, 0, false);
		} else {
			var _mx = median(60, mouse_x, 1860);
			var _my = median(60, mouse_y, 1020);
			x -= (x - _mx) / 8;
			y -= (y - _my) / 8;
		}
	} else if (mouse_check_button_released(mb_left)) {
		dragged = false;
	}
}

if (task == "Wandering") {
	x -= median(-2, (x - walkx) / 20, 2)
	y -= median(-2, (y - walky) / 20, 2)
	if (point_distance(x, y, walkx, walky) <= 16) {
		sprite_index = spr_alien;
		image_xscale = 1;
		task = "...";
		alarm[0] = 80;
	}
}

if (tfc % 60 == 59) {
	if (task == "Taking a leak") {
		potty++;
	} else if (task == "Eating fruit" || task == "Eating a corpse") {
		food++;
	} else if (task == "Eating gold fruit") {
		mood++;
		energy++;
		potty++;
		food++;
	} else if (task == "Eating icecream") {
		mood++;
		food++;
	}
}

if (tfc % 120 == 119) {
	if (task == "Drinking saltwater") {
		mood--;
		energy--;
		potty--;
		food--;
	} else if (task == "Repopulating") {
		mood++;
		energy--;
	} else if (task == "Repopulating\n(asexual style)") {
		energy--;
	}
}

if (tfc % 240 == 239) {
	if (task == "Sunbathing") {
		energy++;
	} else if (task == "Playing in the sand") {
		mood++;
	} else if (task == "Splashing around") {
		mood++;
	} else if (task == "Eating a corpse") {
		potty++;
	}
}

if (tfc % 300 == 299) {
	if (task == "Splashing around") {
		energy--;
	} else if (task == "Digging for\nsand dollars") {
		g.sanddollars += choose(1, 1, 2);
		energy--;
	}
}

if (nfc % 4500 == 4499) {
	mood--;
	energy--;
	potty--;
	food--;
}

var _starve = (food < 1);

mood = median(1, mood, 6);
energy = median(1, energy, 6);
potty = median(1, potty, 6);
food = median(0, food, 6);

if (mood + energy + potty + food <= 4 || _starve) {
	if (!died) {
		audio_play_sound(sfx_dies, 1, false);
		died = true;
	}
	sprite_index = spr_alien_dead;
	image_xscale = 1;
	task = "Dead";
	alarm[0] = -1;
	alarm[1] = -1;
}

if (audio_is_playing(slurrrp) && task != "Drinking saltwater") {
	audio_stop_sound(slurrrp);
}

if (audio_is_playing(patpat) && task != "Wandering") {
	audio_stop_sound(patpat);
}

if (audio_is_playing(diggyhole) && task != "Buried treasure" && task != "Digging for\nsand dollars") {
	audio_stop_sound(diggyhole);
}

if (audio_is_playing(splish) && task != "Splashing around") {
	audio_stop_sound(splish);
}