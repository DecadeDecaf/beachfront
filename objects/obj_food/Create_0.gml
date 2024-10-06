image_xscale = 0;
image_yscale = 0;
image_index = irandom_range(0, 2);

if (g.gapple && image_index == 0) {
	image_index = 3;
} else if (g.icecream && image_index > 0 && random(100) <= 50) {
	image_index = 4;
}