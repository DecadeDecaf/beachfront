x = 960;
y = 540;

lookx = 960;
looky = 540;

camera = camera_create();
zw = 960;
zh = 540;

camera_set_view_size(camera, zw, zh);

var _vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var _pm = matrix_build_projection_ortho(zw, zh, -10000, 10000);

camera_set_view_mat(camera, _vm);
camera_set_proj_mat(camera, _pm);

view_camera[0] = camera;