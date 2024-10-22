function save_room() {
	
	var _collectible_num = instance_number(obj_collectible);
	var _checkpoint_num = instance_number(obj_checkpoint);
	var _hittable_num = instance_number(obj_hittable);
	var _room_struct = {
		collectible_num : _collectible_num,
		collectible_data : array_create(_collectible_num),
		checkpoint_num : _checkpoint_num,
		checkpoint_data : array_create(_checkpoint_num),
		hittable_num : _hittable_num,
		hittable_data : array_create(_hittable_num)
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
	
	// save hittable
	for (var _i = 0; _i < _hittable_num; _i++) {
		var _inst = instance_find(obj_hittable, _i);
		var _data = {
			x : _inst.x,
			y : _inst.y,
			has_hit : _inst.has_hit,
			object_type : _inst.object_index,
		}
		if (variable_instance_exists(_inst, "door_index")) {
	        _data.door_index = _inst.door_index;
	    }
		_room_struct.hittable_data[_i] = _data;
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
		instance_create_layer(_collectible.x, _collectible.y, "Interactables", obj_collectible);
	}
	
	// for collectibles, destroy default and create with saved data
	if instance_exists(obj_checkpoint) {
		instance_destroy(obj_checkpoint);
	}
	for (var _i = 0; _i < _room_struct.checkpoint_num; _i++) {
		var _checkpoint = _room_struct.checkpoint_data[_i];
		with (instance_create_layer(_checkpoint.x, _checkpoint.y, "Interactables", obj_checkpoint)) {
			interacted = _checkpoint.interacted;
		}
	}
	
	// for collectibles, destroy default and create with saved data
	if instance_exists(obj_hittable) {
		instance_destroy(obj_hittable);
	}
	for (var _i = 0; _i < _room_struct.hittable_num; _i++) {
		var _hittable = _room_struct.hittable_data[_i];
		var _obj_index = _hittable.object_type;
		var _inst = instance_create_layer(_hittable.x, _hittable.y, "Interactables", _obj_index);
		with (_inst) {
			if (variable_instance_exists(_inst, "door_index")) {
		        door_index = _hittable.door_index;
		    }
			has_hit = _hittable.has_hit;
		}
	}
	
}