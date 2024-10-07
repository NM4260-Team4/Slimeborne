if (distance_to_object(obj_player) < 20) {
	
	if keyboard_check(ord("E")) {
		save_game();
	}

	image_index = 1;

} else {
	image_index = 0;
}
