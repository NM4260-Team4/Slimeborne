// for enabling/disabling
var _all_hit = true;

if (instance_exists(obj_wind_pipe)) {
	with(obj_wind_pipe) {
		if (item_index == other.zone_index) {
			if (state != PIPE_STATE.HEATING) {
				_all_hit = false;
				other.sprite_index = spr_float_zone_empty;
			} else {
				other.sprite_index = spr_float_zone;
			}
		}
	}
}

if (!_all_hit) {
	exit;
}

// for floating
if (!instance_exists(obj_player)) exit;

if (place_meeting(x, y, obj_player)) {
	obj_player.move_x = x_air_direction;
	obj_player.move_y = y_air_direction;
}