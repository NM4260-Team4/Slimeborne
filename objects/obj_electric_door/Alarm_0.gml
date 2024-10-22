var _all_hit = true;

if (instance_exists(obj_generator)) {
	with(obj_generator) {
		if (door_index == other.door_index) {
			if (!has_hit) {
				_all_hit = false;
			}
		}
	}
}

if (_all_hit) {
	is_open = true;
	activated = true;
	y -= sprite_height;
}
