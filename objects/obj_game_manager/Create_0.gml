layer_sequence_create("Instances", 0, 0, seq_hud);

paused = false;

active_seq = NaN;
control_seq = NaN;

function draw_paused(_seq) {
	obj_player.check_animation(true);
	obj_player.just_paused = true;
	var _camera_x = camera_get_view_x(view_camera[0]);
	var _camera_y = camera_get_view_y(view_camera[0]);
	active_seq = layer_sequence_create(layer, _camera_x, _camera_y, _seq);
	instance_deactivate_all(true);
	paused = true;
}

function remove_draw() {
	instance_activate_all();
	paused = false;
	layer_sequence_destroy(pause_seq);
}
