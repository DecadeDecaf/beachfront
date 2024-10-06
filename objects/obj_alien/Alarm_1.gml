if (task == "Repopulating\n(asexual style)") {
	instance_create_depth(x + random_range(-48, 48), y + 48, depth - 1, obj_alien);
}

if (task == "Buried treasure") {
	var _digspot = instance_nearest(x, y, obj_x);
	var _digat = false;
	if (instance_exists(_digspot)) {
		if (point_distance(x, y, _digspot.x, _digspot.y) < 48) {
			g.sanddollars += (g.treasure_upgrade ? 10 : 5);
			instance_destroy(_digspot);
		}
	}
}

if (task == "Repopulating") {
	x += 10000;
	var _friend = instance_nearest(x - 10000, y, obj_alien);
	x -= 10000;

	if (point_distance(x, y, _friend.x, _friend.y) < 96 && id != _friend.id && _friend.task == "Repopulating") {
		_friend.sprite_index = spr_alien;
		_friend.image_xscale = 1;
		_friend.task = "...";
		_friend.alarm[0] = 120;
		instance_create_depth(x + random_range(-48, 48), y + 48, depth - 1, obj_alien);
	}
}

sprite_index = spr_alien;
image_xscale = 1;
task = "...";
alarm[0] = 120;