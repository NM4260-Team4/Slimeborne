if (sprite_index == spr_player_jump) {
	image_speed = 0;
	image_index = image_number - 1;
}

if (sprite_index == spr_player_fall) {
	image_speed = 0;
	image_index = image_number - 1;
	change_state(PLAYER_STATE.IDLE);
}

if (sprite_index == spr_player_on_hit) {
	image_speed = 0;
	image_index = image_number - 1;
	if (grounded) {
		change_state(PLAYER_STATE.IDLE);
	} else if (move_y > 0) {
		change_state(PLAYER_STATE.FALL);
	} else {
		change_state(PLAYER_STATE.IDLE);
	}
}