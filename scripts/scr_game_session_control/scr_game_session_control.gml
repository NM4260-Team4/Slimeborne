function save_game() {

	var _save_array = array_create(0);
	
	global.player_state.max_hp = obj_player.max_hp;
	global.player_state.hp = obj_player.hp;
	global.player_state.microplastics = obj_player.microplastics;
	global.player_state.respawn_x = obj_player.x;
	global.player_state.respawn_y = obj_player.y;
	global.player_state.current_room = room_get_name(room);
	
	// save microplastics, inventory, attachment owned, and accessories
	
	array_push(_save_array, global.player_state);
	

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
	
	var _load_array = json_parse(_json);
	
	global.player_state = array_get(_load_array, 0);
}

function init_game() {

}