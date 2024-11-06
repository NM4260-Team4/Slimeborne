event_inherited();

var _camera_x = camera_get_view_x(view_camera[0]);
var _camera_y = camera_get_view_y(view_camera[0]);
obj_game_manager.prev_seq = seq_checkpoint;
layer_sequence_destroy(obj_game_manager.active_seq);
obj_game_manager.active_seq = layer_sequence_create(layer, _camera_x, _camera_y, seq_shop);



