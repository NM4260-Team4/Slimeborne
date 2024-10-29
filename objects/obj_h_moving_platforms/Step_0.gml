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
