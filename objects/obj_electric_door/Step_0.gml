if (is_open) {exit;}

var _all_hit = true;

if (instance_exists(obj_generator)) {
	with(obj_generator) {
		if (item_index == other.door_index) {
			if (!has_hit) {
				_all_hit = false;
			}
		}
	}
}

if (_all_hit) {
	activated = true;
}

if (activated) {
	if (initial_y - sprite_height < y) {
		y -= 2;
	}
}
