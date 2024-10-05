if (!audio_is_playing(mus_game)) {
	audio_play_sound(mus_game, 1, true);
}

if (g.fc % 200 == 0) {
	instance_create_depth(0, 160, 99, obj_wave);
}

handle_fullscreen();
handle_mute();

if (mouse_check_button_pressed(mb_left)) {
	if (!position_meeting(mouse_x, mouse_y, obj_alien)) {
		g.alien = -1;
	}
}

