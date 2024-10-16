if (interacted) {
	image_index = 1;
}

if (distance_to_object(obj_player) < 20) {
	
	show_prompt = true;
	
	if keyboard_check(ord("E")) {
		obj_player.hp = obj_player.max_hp;
		interacted = true;
		save_game(true);
	}

} else {
	show_prompt = false;
}
