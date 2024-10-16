function save_room() {
	
	var _collectible_num = instance_number(obj_collectible);
	var _checkpoint_num = instance_number(obj_checkpoint);
	var _room_struct = {
		collectible_num : _collectible_num,
		collectible_data : array_create(_collectible_num),
		checkpoint_num : _checkpoint_num,
		checkpoint_data : array_create(_checkpoint_num),
	}
	
	// save collectibles
	for (var _i = 0; _i < _collectible_num; _i++) {
		var _inst = instance_find(obj_collectible, _i);
		_room_struct.collectible_data[_i] = {
			x : _inst.x,
			y : _inst.y
		}
	}
	
	// save checkpoint
	for (var _i = 0; _i < _checkpoint_num; _i++) {
		var _inst = instance_find(obj_checkpoint, _i);
		_room_struct.checkpoint_data[_i] = {
			x : _inst.x,
			y : _inst.y,
			interacted : _inst.interacted,
		}
	}
	
	// save to specific room
	if room == rm_tutorial {global.room_data.tutorial = _room_struct;}
	if room == rm_generator_room {global.room_data.generator_room = _room_struct;}
	
}

function load_room() {
	
	var _room_struct = 0;
	
	// get the correct struct
	if room == rm_tutorial {_room_struct = global.room_data.tutorial}
	if room == rm_generator_room {_room_struct = global.room_data.generator_room}
	
	if !is_struct(_room_struct) {exit;}
	
	// for collectibles, destroy default and create with saved data
	if instance_exists(obj_collectible) {
		instance_destroy(obj_collectible);
	}
	for (var _i = 0; _i < _room_struct.collectible_num; _i++) {
		var _collectible = _room_struct.collectible_data[_i];
		instance_create_layer(_collectible.x, _collectible.y, layer, obj_collectible);
	}
	
	// for collectibles, destroy default and create with saved data
	if instance_exists(obj_checkpoint) {
		instance_destroy(obj_checkpoint);
	}
	for (var _i = 0; _i < _room_struct.checkpoint_num; _i++) {
		var _checkpoint = _room_struct.checkpoint_data[_i];
		with (instance_create_layer(_checkpoint.x, _checkpoint.y, layer, obj_checkpoint)) {
			interacted = _checkpoint.interacted;
		}
	}
	
}