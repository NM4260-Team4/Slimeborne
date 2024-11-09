function save_room() {
	
	var _interactable_num = instance_number(obj_interactable);
	var _hittable_num = instance_number(obj_hittable);
	var _boss_num = instance_number(obj_bigslime);
	var _room_struct = {
		interactable_num : _interactable_num,
		interactable_data : array_create(_interactable_num),
		hittable_num : _hittable_num,
		hittable_data : array_create(_hittable_num),
		boss_num : _boss_num,
		boss_data : array_create(_boss_num),
	}
	
	// save interactable
	for (var _i = 0; _i < _interactable_num; _i++) {
		var _inst = instance_find(obj_interactable, _i);
		_room_struct.interactable_data[_i] = {
			x : _inst.x,
			y : _inst.y,
			interacted : _inst.interacted,
			object_type : _inst.object_index,
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
		if (variable_instance_exists(_inst, "item_index")) {
	        _data.item_index = _inst.item_index;
	    }
		_room_struct.hittable_data[_i] = _data;
	}
	
	// save bosses
	for (var _i = 0; _i < _boss_num; _i++) {
		var _inst = instance_find(obj_bigslime, _i);
		var _data = {
			spawn_x : _inst.spawn_x,
			spawn_y : _inst.spawn_y,
			object_type : _inst.object_index,
		}
		_room_struct.boss_data[_i] = _data;
	}
	
	// save to specific room
	if room == rm_tutorial {global.room_data.tutorial = _room_struct;}
	if room == rm_generator_room {global.room_data.generator_room = _room_struct;}
	if room == rm_furnace {global.room_data.furnance = _room_struct;}
	
}

function load_room() {
	var _room_struct = 0;
	
	// get the correct struct
	if room == rm_tutorial {_room_struct = global.room_data.tutorial}
	if room == rm_generator_room {_room_struct = global.room_data.generator_room}
	if room == rm_furnace {_room_struct = global.room_data.furnance}
	
	if !is_struct(_room_struct) {exit;}
	
	// for collectibles, destroy default and create with saved data
	if instance_exists(obj_interactable) {
		instance_destroy(obj_interactable);
	}
	for (var _i = 0; _i < _room_struct.interactable_num; _i++) {
		var _interactable = _room_struct.interactable_data[_i];
		var _obj_index = _interactable.object_type;
		with (instance_create_layer(_interactable.x, _interactable.y, "Interactables", _obj_index)) {
			interacted = _interactable.interacted;
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
			if (variable_instance_exists(_inst, "item_index")) {
		        item_index = _hittable.item_index;
		    }
			has_hit = _hittable.has_hit;
		}
	}
	
	// for bosses, destroy default and create with saved data
	if instance_exists(obj_bigslime) {
		instance_destroy(obj_bigslime);
	}
	for (var _i = 0; _i < _room_struct.boss_num; _i++) {
		var _boss = _room_struct.boss_data[_i];
		var _obj_index = _boss.object_type;
		var _inst = instance_create_layer(_boss.spawn_x, _boss.spawn_y, "Enemies", _obj_index);
	}
	
}