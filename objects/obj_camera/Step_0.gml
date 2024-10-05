var _w = camera_get_view_width(camera);
var _h = camera_get_view_height(camera);

var _up = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var _down = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var _left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _right = (keyboard_check(ord("D")) || keyboard_check(vk_right));

var _sw = 320;
var _sh = 160;

if (abs(lookx - mouse_x) > _sw) {
	if (lookx - mouse_x > 0) { 
		lookx -= (abs(lookx - mouse_x) - _sw) / 8;
	} else {
		lookx += (abs(lookx - mouse_x) - _sw) / 8;
	}
}

if (abs(looky - mouse_y) > _sh) {
	if (looky - mouse_y > 0) { 
		looky -= (abs(looky - mouse_y) - _sh) / 4.5;
	} else {
		looky += (abs(looky - mouse_y) - _sh) / 4.5;
	}
}

var _pan = 10;

if (_up) {
	looky -= _pan;
}
if (_down) {
	looky += _pan;
}
if (_left) {
	lookx -= _pan;
}
if (_right) {
	lookx += _pan;
}

var _midw = (_w / 2);
var _midh = (_h / 2);

lookx = median(_midw, lookx, room_width - _midw);
looky = median(_midh, looky, room_height - _midh);

x += (lookx - x) / 12;
y += (looky - y) / 12;

var _camx = median(_midw, x, room_width - _midw);
var _camy = median(_midh, y, room_height - _midh);

x = _camx;
y = _camy;

var _vm = matrix_build_lookat(_camx, _camy, -10, _camx, _camy, 0, 0, 1, 0);
camera_set_view_mat(camera, _vm);