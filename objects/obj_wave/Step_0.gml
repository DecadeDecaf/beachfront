y -= y / 40;

if (y < 5) {
	image_alpha -= 0.0075;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}