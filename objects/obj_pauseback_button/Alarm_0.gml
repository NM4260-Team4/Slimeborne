event_inherited();
layer_sequence_destroy(obj_game_manager.pause_seq);
var _camera_x = camera_get_view_x(view_camera[0]);
var _camera_y = camera_get_view_y(view_camera[0]);
obj_game_manager.pause_seq = layer_sequence_create(layer, _camera_x, _camera_y, seq_paused);
