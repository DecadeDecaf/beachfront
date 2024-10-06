if (point_distance(x, y, mouse_x, mouse_y) < 48) {
	if (image_xscale < 1) { image_xscale += 0.1; }
	if (image_yscale < 1) { image_yscale += 0.1; }
	if (mouse_check_button_pressed(mb_left) && g.sanddollars >= price) {
		g.sanddollars -= price;
		if (sprite_index == spr_button_towel) {
			instance_create_depth(x, y, 98, obj_towel);
		} else if (sprite_index == spr_button_fruit) {
			g.tree_upgrade = true;
			var _but = instance_create_depth(x, y, depth, obj_button);
			_but.sprite_index = spr_button_fruit_two;
			_but.price = 36;
		} else if (sprite_index == spr_button_fruit_two) {
			g.tree_upgrade_two = true;
		} else if (sprite_index == spr_button_treasure) {
			g.treasure_upgrade = true;
		} else if (sprite_index == spr_button_icecream) {
			g.icecream = true;
		} else if (sprite_index == spr_button_gold) {
			g.gapple = true;
		} else if (sprite_index == spr_button_tide) {
			g.tide = true;
		} else if (sprite_index == spr_button_rizz) {
			g.rizz = true;
		} else if (sprite_index == spr_button_corpse) {
			g.corpse = true;
		} else if (sprite_index == spr_button_sandcastle) {
			instance_create_depth(1408, 672, 97, obj_sandcastle);
		}
		audio_play_sound(sfx_chaching, 0, false);
		instance_destroy();
	}
} else {
	if (image_xscale > 0.6) { image_xscale -= 0.1; }
	if (image_yscale > 0.6) { image_yscale -= 0.1; }
}