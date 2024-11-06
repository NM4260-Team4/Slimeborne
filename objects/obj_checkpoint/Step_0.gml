if (interacted) {
	image_index = 1;
}

if (distance_to_object(obj_player) < 20) {
	
	show_prompt = true;
	
	if keyboard_check(ord("E")) {
		obj_game_manager.curr_checkpoint = self;
		obj_game_manager.draw_paused(seq_checkpoint);
	}

} else {
	show_prompt = false;
}
