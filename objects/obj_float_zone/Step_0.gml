if (!instance_exists(obj_player)) exit;

if (place_meeting(x, y, obj_player)) {
	obj_player.move_x = x_air_direction;
	obj_player.move_y = y_air_direction;
}