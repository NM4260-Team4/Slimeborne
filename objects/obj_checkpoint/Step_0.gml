if (distance_to_object(obj_player) < 20) {
	
	if keyboard_check(ord("E")) {
		obj_player.hp = obj_player.max_hp;
		save_game();
	}

	image_index = 1;

} else {
	image_index = 0;
}
