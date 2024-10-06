if (!audio_is_playing(mus_game)) {
	audio_play_sound(mus_game, 1, true);
}

if (g.fc % 200 == 0) {
	instance_create_depth(0, 160, 99, obj_wave);
}

var _freq = (g.treasure_upgrade ? 1600 : 3000)
var _max = (g.treasure_upgrade ? 2 : 1)


if (g.fc % _freq == 600 && instance_number(obj_x) < 1) {
	var _x_x = irandom_range(60, 1860);
	var _x_y = irandom_range(60, 1020);
	if (position_meeting(_x_x, _x_y, obj_hitbox_sand) && !position_meeting(_x_x, _x_y, obj_tree)) {
		instance_create_depth(_x_x, _x_y, 99, obj_x);
	}
}

_freq = (g.tree_upgrade_two ? 1500 : (g.tree_upgrade ? 2400 : 4200));
_max = (g.tree_upgrade_two ? 5 : (g.tree_upgrade ? 3 : 1));

if (g.fc % _freq == 1200 && instance_number(obj_food) < _max) {
	var _x_x = irandom_range(60, 690);
	var _x_y = irandom_range(260, 400);
	instance_create_depth(_x_x, _x_y, 97, obj_food);
}

handle_fullscreen();
handle_mute();

if (mouse_check_button_pressed(mb_left)) {
	if (!position_meeting(mouse_x, mouse_y, obj_alien)) {
		g.alien = -1;
	}
}

with (obj_alien) {
	if (dragged) {
		g.alien = id;
	}
}