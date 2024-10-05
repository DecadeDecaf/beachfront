function create_macros() {
	#macro g global
	#macro o other
}

function init() {
	create_macros();
	
	g.desktop = (os_browser == browser_not_a_browser);
	g.mute = false;
	g.vol = 0.75;
	g.fc = 0;
	
	draw_set_circle_precision(64);
	if (g.desktop) {
		surface_resize(application_surface, 960, 540);
		window_set_size(960, 540);
	} else {
		surface_resize(application_surface, 960, 540);
		var _vx = camera_get_view_width(view_camera[0]);
		var _vy = camera_get_view_height(view_camera[0]);
		display_set_gui_size(_vx, _vy);
	}
	display_reset(8, true);
	
	audio_master_gain(g.vol);
	//audio_play_sound(mus_game, 1, true);
	
	exception_unhandled_handler(error);
	randomize();
}

function handle_mute() {
	var m = keyboard_check_pressed(ord("M"));
	if (m) { switch_mute(); }
}

function switch_mute() {
	g.mute = !g.mute;
	audio_master_gain((g.mute ? 0 : g.vol));
	return g.mute;
}

function handle_fullscreen() {
	var f = keyboard_check_pressed(ord("F"));
	if (f && g.desktop) { switch_fullscreen(); }
}

function switch_fullscreen() {
	var full = !window_get_fullscreen();
	set_fullscreen(full);
	return full;
}

function set_fullscreen(full) {
	window_set_fullscreen(full);
	window_set_size((full ? 1920 : 1280), (full ? 1080 : 720));
	display_reset(8, true);
}

function error(struct) {
	show_debug_message("ERROR: " + string(struct));
}