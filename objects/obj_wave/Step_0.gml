y -= (y - wtide) / 40;

if (y < (5 + wtide)) {
	image_alpha -= 0.0075;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}