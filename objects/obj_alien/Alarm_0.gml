if (y > 950) {
	if (potty < 4 && random(100) <= 80) {
		sprite_index = spr_alien_leak;
		task = "Taking a leak";
		alarm[1] = 300;
	} else if (random(100) <= 70) {
		sprite_index = spr_alien_splashing;
		task = "Splashing around";
		alarm[1] = 1200;
	} else {
		sprite_index = spr_alien_drinking;
		task = "Drinking saltwater";
		alarm[1] = 600;
	}
} else {
	if (energy > 2 && random(100) <= 40) {
		task = "Digging for cash";
		alarm[1] = 1800;
	} else {
		sprite_index = spr_alien_sunbathing;
		task = "Sunbathing";
		alarm[1] = 1800;
	}
}

tfc = 0;