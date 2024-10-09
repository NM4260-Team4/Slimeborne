if (distance_to_object(obj_player) < 20) {
	
	show_prompt = true;
	
	if keyboard_check(ord("E")) {
		obj_player.hp = obj_player.max_hp;
		global.player_state.respawn_x = obj_player.x;
		global.player_state.respawn_y = obj_player.y;
		save_game();
	}

	image_index = 1;

} else {
	image_index = 0;
	show_prompt = false;
}
