if (!instance_exists(obj_player) or !instance_exists(obj_bigslime)) {
	sprite_index = spr_spikes_empty;
	exit;
}

if (obj_player.bbox_left > x + sprite_width / 2) {
	if (is_left_locked) {
		sprite_index = spr_spikes;
		image_speed = 1;
	} else {
		sprite_index = spr_spikes_empty;
	}
} else if (obj_player.bbox_right < x - sprite_width / 2) {
	if (is_left_locked) {
		sprite_index = spr_spikes_empty;
	} else {
		sprite_index = spr_spikes;
		image_speed = 1;
	}
}
