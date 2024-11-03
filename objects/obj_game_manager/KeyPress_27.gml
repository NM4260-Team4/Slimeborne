if paused {
	instance_activate_all();
	paused = false;
	layer_sequence_destroy(pause_seq);
} else {
	obj_player.check_animation(true);
	obj_player.just_paused = true;
	var _camera_x = camera_get_view_x(view_camera[0]);
	var _camera_y = camera_get_view_y(view_camera[0]);
	pause_seq = layer_sequence_create(layer, _camera_x, _camera_y, seq_paused);
	instance_deactivate_all(true);
	paused = true;
}