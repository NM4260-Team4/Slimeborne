if (distance_to_object(obj_player) < 40) {
	
	show_prompt = true;
	
	if keyboard_check(ord("E")) {
		obj_player.max_hp ++;
		save_game(false);
		instance_destroy();
	}

} else {
	show_prompt = false;
}
