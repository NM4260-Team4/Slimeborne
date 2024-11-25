if (!instance_exists(obj_player)) {
	exit;
}

var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);

var _cam_x = obj_player.x - _cam_width / 2;
var _cam_y = obj_player.y - _cam_height / 2;

_cam_x = clamp(_cam_x, 0, room_width - _cam_width);
_cam_y = clamp(_cam_y, 0, room_height - _cam_height);

camera_set_view_pos(view_camera[0], _cam_x, _cam_y);