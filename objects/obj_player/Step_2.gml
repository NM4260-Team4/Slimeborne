// sprite flip
if (move_dir < 0) {
	image_xscale = -1;
	image_yscale = 1;
} else if (move_dir > 0) {
	image_xscale = 1;
	image_yscale = 1;
}

// respawn
if (hp <= 0) {
	// TODO: play death animation and add black out
	load_game();
	instance_destroy();
	var _respawn_x = global.player_state.respawn_x;
	var _respawn_y = global.player_state.respawn_y;

	instance_create_layer(_respawn_x, _respawn_y, "Instances", obj_player);
}

// state machine
switch (sprite_index) {
	
	case spr_player_move:
	
		if (move_x == 0) {
			sprite_index = spr_player_idle;
		}
		
		//if (move_y > 1) {
		//	sprite_index = spr_player_fall;
		//	image_index = 0;
		//}
		break;
	
	case spr_player_attack:
		if (image_index >= image_number) {
			is_attacking = false;
			sprite_index = spr_player_idle;
		}
		break;
	
}
