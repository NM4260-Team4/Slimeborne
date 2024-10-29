// for enabling/disabling
var _all_hit = true;

if (instance_exists(obj_generator)) {
	with(obj_generator) {
		if (item_index == other.platform_index) {
			if (!has_hit) {
				_all_hit = false;
			}
		}
	}
}

if (!_all_hit) {
	exit;
}

// for platform movement
x += move_dir * move_speed;
moved_distance += move_speed;

if (moved_distance >= distance_limit) {
	move_dir *= -1;
	moved_distance = 0;
}

if (!instance_exists(obj_player)) {
	exit;
} else {
	if (place_meeting(x, y - 1, obj_player)) {
		obj_player.x += move_dir * move_speed;
	}
}
