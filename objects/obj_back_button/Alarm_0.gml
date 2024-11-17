event_inherited();
if instance_exists(obj_globals) {
	layer_sequence_destroy(obj_globals.overlay_sequence);
} else {
	layer_sequence_destroy(obj_game_manager.active_seq);
	var _camera_x = camera_get_view_x(view_camera[0]);
	var _camera_y = camera_get_view_y(view_camera[0]);
	obj_game_manager.active_seq = layer_sequence_create(layer, _camera_x, _camera_y, obj_game_manager.prev_seq);
}

