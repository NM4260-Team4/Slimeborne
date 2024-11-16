global.in_transition = false;
global.next_room = -1;

function place_transition(_type) {
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-1000, "transition");
	var _camera_x = camera_get_view_x(view_camera[0]);
	var _camera_y = camera_get_view_y(view_camera[0]);
	layer_sequence_create(_lay, _camera_x, _camera_y, _type);
}

function start_room_transition(_next_room, _type_out, _type_in) {
	if (!global.in_transition) {
		global.in_transition = true;
		global.next_room = _next_room;
		place_transition(_type_out);
		//layer_set_target_room(_next_room);
		//place_transition(_type_in);
		//layer_reset_target_room();
		return true;
	} else {
		return false;
	}
}

function change_room_in_transition() {
	room_goto(global.next_room);
	global.in_transition = false;
}

function finish_transition() {
	layer_sequence_destroy(self.elementID);
	global.in_transition = false;
	show_debug_message("transition end");
}
