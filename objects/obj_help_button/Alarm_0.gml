event_inherited();

if instance_exists(obj_globals) {
	obj_globals.overlay_sequence = layer_sequence_create("Instances", 0, 0, seq_control);
} else {
	var _camera_x = camera_get_view_x(view_camera[0]);
	var _camera_y = camera_get_view_y(view_camera[0]);

	obj_game_manager.prev_seq = seq_paused;
	layer_sequence_destroy(obj_game_manager.active_seq);
	obj_game_manager.active_seq = layer_sequence_create(layer, _camera_x, _camera_y, seq_pausecontrol);
}





