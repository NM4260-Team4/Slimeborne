if (distance_to_object(obj_player) < 40) {
	
	show_prompt = true;
	
	if keyboard_check(ord("E")) {
		obj_player.max_hp ++;
		instance_destroy();
		save_game(false);
	}

} else {
	show_prompt = false;
}
