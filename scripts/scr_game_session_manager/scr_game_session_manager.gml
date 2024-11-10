function save_game(_should_save_location) {

	var _save_array = array_create(0);
	
	// save room
	save_room();
	
	if (_should_save_location) {
		global.player_state.respawn_x = obj_player.x;
		global.player_state.respawn_y = obj_player.y;
	}
	global.player_state.max_hp = obj_player.max_hp;
	global.player_state.hp = obj_player.hp;
	// global.player_state.microplastics = obj_player.microplastics;
	global.player_state.current_room = room_get_name(room);
	
	// save inventory, attachment owned, and accessories
	
	array_push(_save_array, global.player_state);
	array_push(_save_array, global.inventory);
	array_push(_save_array, global.equipped);
	array_push(_save_array, global.room_data);

	var _filename = "save.sav";
	var _json = json_stringify(_save_array);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);

}

function load_game() {
	var _filename = "save.sav";
	if !file_exists(_filename) exit;
	
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _layer_id = layer_get_id("Attachments");
	var _elements = layer_get_all_elements(_layer_id);
	for (var _i = 0; _i < array_length(_elements); _i++) {
		if (layer_get_element_type(_elements[_i]) == layerelementtype_instance) {
			var _layerelement = _elements[_i];
	        var _inst = layer_instance_get_instance(_layerelement);
			instance_destroy(_inst);
		}
	}
	
	var _load_array = json_parse(_json);
	
	// player data
	global.player_state = array_get(_load_array, 0);
	global.inventory = array_get(_load_array, 1);
	global.equipped = array_get(_load_array, 2);
	global.room_data = array_get(_load_array, 3);
	
	if (room == rm_menu) {
		exit;
	}
	
	global.attachments = [];
	for (var _i = 0; _i < global.inventory.num_attachments; _i++) {
		array_push(global.attachments, instance_create_layer(0, 0, "Attachments", global.inventory.attachments[_i]));
	}
	
	if (global.equipped.has_attachment) {
		global.equipped_attachment = global.attachments[global.equipped.equipped_attachment_pos];
		global.equipped.equipped_attachment = global.equipped_attachment.object_index;
	}
	
	// load level data
	load_room();
	
}

function init_game() {
	var _filename = "save.sav";
	if file_exists(_filename) {
		file_delete(_filename);
	}
	
	global.player_state.max_hp = global.default_hp;
	global.player_state.hp = global.player_state.max_hp;
	// global.player_state.microplastics = 0;
	global.player_state.current_room = "rm_tutorial";
	global.player_state.respawn_x = -1;
	global.player_state.respawn_y = -1;
	
	// initialise other global variables here
}