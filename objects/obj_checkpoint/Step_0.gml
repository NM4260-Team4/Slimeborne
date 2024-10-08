if (distance_to_object(obj_player) < 20) {
	
	show_prompt = true;
	
	if keyboard_check(ord("E")) {
		obj_player.hp = obj_player.max_hp;
		save_game();
	}

	image_index = 1;

} else {
	image_index = 0;
	show_prompt = false;
}
