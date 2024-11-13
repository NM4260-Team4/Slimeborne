height_added = -34;

function trigger_jump_pad() {
	if (instance_exists(obj_jump_pad)) {
		with(obj_jump_pad) {
			if (pad_index == other.pad_index) {
				self.image_speed = 1;
			}
		}
	}
}
