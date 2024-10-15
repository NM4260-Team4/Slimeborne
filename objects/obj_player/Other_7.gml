if (sprite_index == spr_player_jump) {
	image_speed = 0;
	image_index = image_number - 1;
}

if (sprite_index == spr_player_fall) {
	image_speed = 0;
	image_index = image_number - 1;
	change_state(PLAYER_STATE.IDLE);
}
