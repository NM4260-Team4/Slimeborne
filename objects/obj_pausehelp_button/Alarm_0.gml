event_inherited();

var _camera_x = camera_get_view_x(view_camera[0]);
var _camera_y = camera_get_view_y(view_camera[0]);
layer_sequence_destroy(obj_game_manager.pause_seq);
obj_game_manager.pause_seq = layer_sequence_create(layer, _camera_x, _camera_y, seq_pausecontrol);

//obj_globals.overlay_sequence = layer_sequence_create("Instances", 0, 0, seq_control);


