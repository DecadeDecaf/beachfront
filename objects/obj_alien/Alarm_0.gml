x += 10000;
var _friend = instance_nearest(x - 10000, y, obj_alien)
x -= 10000;

var _rizz = (g.rizz ? 1 : 0)

var _near_castle = false;

with (obj_sandcastle) {
	if (point_distance(x, y, o.x, o.y) < 112) {
		_near_castle = true;
	}
}

if (point_distance(x, y, _friend.x, _friend.y) < 96 && id != _friend.id && _friend.task != "Dead" && mood > 3 && food > 2 && energy > 3 && potty > 2 && _friend.mood + _rizz > 3 && _friend.food + _rizz > 2 && _friend.energy + _rizz > 3 && _friend.potty + _rizz > 2) {
	sprite_index = spr_alien_sex;
	task = "Repopulating";
	_friend.sprite_index = spr_alien_sex;
	_friend.task = "Repopulating";
	alarm[1] = 600;
} else if (g.corpse && point_distance(x, y, _friend.x, _friend.y) < 96 && id != _friend.id && _friend.task == "Dead" && food < 6) {
	sprite_index = spr_alien_eat;
	task = "Eating a corpse";
	alarm[1] = 450;
	instance_destroy(_friend);
} else if (position_meeting(x, y, obj_towel)) {
	if (energy < 6) {
		sprite_index = spr_alien_sunbathing;
		task = "Sunbathing";
		alarm[1] = 1800;
	} else if (mood > 4 && food > 3 && energy > 4 && potty > 3) {
		sprite_index = spr_alien_sex;
		task = "Repopulating\n(asexual style)";
		alarm[1] = 600;
	} else {
		sprite_index = spr_alien_walking;
		task = "Wandering";
		walkx = irandom_range(60, 1860);
		walky = irandom_range(60, 1020);
		image_xscale = (x < walkx ? 1 : -1);
	}
} else if (_near_castle) {
	if (mood < 6) {
		sprite_index = spr_alien_play;
		task = "Playing in the sand";
		alarm[1] = 1800;
	} else {
		sprite_index = spr_alien_walking;
		task = "Wandering";
		walkx = irandom_range(60, 1860);
		walky = irandom_range(60, 1020);
		image_xscale = (x < walkx ? 1 : -1);
	}
} else if (y > (g.tide ? 820 : 940)) {
	if ((potty < 4 && random(100) <= 75) || potty < 2) {
		sprite_index = spr_alien_leak;
		task = "Taking a leak";
		alarm[1] = 300;
	} else if (mood < 6 && random(100) <= 70) {
		sprite_index = spr_alien_splashing;
		task = "Splashing around";
		alarm[1] = 1200;
	} else if (random(100) <= 40) {
		sprite_index = spr_alien_drinking;
		task = "Drinking saltwater";
		alarm[1] = 600;
	} else {
		sprite_index = spr_alien_walking;
		task = "Wandering";
		walkx = irandom_range(60, 1860);
		walky = irandom_range(820, 1020);
		image_xscale = (x < walkx ? 1 : -1);
	}
} else if (position_meeting(x, y, obj_hitbox_sand)) {
	var _digspot = instance_nearest(x, y, obj_x);
	var _digat = false;
	if (instance_exists(_digspot)) {
		if (point_distance(x, y, _digspot.x, _digspot.y) < 48) {
			_digat = true;
		}
	}
	var _foodspot = instance_nearest(x, y, obj_food);
	var _foodat = false;
	if (instance_exists(_foodspot)) {
		if (point_distance(x, y, _foodspot.x, _foodspot.y) < 48) {
			_foodat = true;
		}
	}
	if (_digat) {
		sprite_index = spr_alien_dig;
		task = "Buried treasure";
		alarm[1] = 900;
	} else if (_foodat && food < 6) {
		sprite_index = spr_alien_eat;
		task = (_foodspot.image_index == 3 ? "Eating gold fruit" : (_foodspot.image_index == 4 ? "Eating icecream" : "Eating fruit"));
		alarm[1] = 450;
		instance_destroy(_foodspot);
	} else if (energy > 2 && random(100) <= 40) {
		sprite_index = spr_alien_dig;
		task = "Digging for\nsand dollars";
		alarm[1] = 1200;
	} else if ((energy < 5 && random(100) <= 40) || energy < 2) {
		sprite_index = spr_alien_sunbathing;
		task = "Sunbathing";
		alarm[1] = 1800;
	} else if ((mood < 5 && random(100) <= 40) || mood < 2) {
		sprite_index = spr_alien_play;
		task = "Playing in the sand";
		alarm[1] = 1800;
	} else if (mood > 4 && food > 3 && energy > 4 && potty > 3 && random(100) <= 15) {
		sprite_index = spr_alien_sex;
		task = "Repopulating\n(asexual style)";
		alarm[1] = 600;
	} else {
		sprite_index = spr_alien_walking;
		task = "Wandering";
		walkx = irandom_range(60, 1860);
		walky = irandom_range(60, 1020);
		image_xscale = (x < walkx ? 1 : -1);
	}
} else {
	if (mood > 4 && food > 3 && energy > 4 && potty > 3 && random(100) <= 35) {
		sprite_index = spr_alien_sex;
		task = "Repopulating\n(asexual style)";
		alarm[1] = 600;
	} else {
		sprite_index = spr_alien_walking;
		task = "Wandering";
		walkx = irandom_range(60, 1860);
		walky = irandom_range(60, 1020);
		image_xscale = (x < walkx ? 1 : -1);
	}
}

tfc = 0;