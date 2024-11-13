function save_room() {
	
	var _interactable_num = instance_number(obj_interactable);
	var _hittable_num = instance_number(obj_hittable);
	var _boss_num = instance_number(obj_bigslime);
	var _enemy_num = instance_number(obj_enemy_parent);
	var _room_struct = {
		interactable_num : _interactable_num,
		interactable_data : array_create(_interactable_num),
		hittable_num : _hittable_num,
		hittable_data : array_create(_hittable_num),
		boss_num : _boss_num,
		boss_data : array_create(_boss_num),
		enemy_num : _enemy_num,
		enemy_data : array_create(_enemy_num),
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
	
	// save normal enemies
	for (var _i = 0; _i < _enemy_num; _i++) {
		var _inst = instance_find(obj_enemy_parent, _i);
		var _data = {
			spawn_x : _inst.xstart,
			spawn_y : _inst.ystart,
			object_type : _inst.object_index,
		}
		_room_struct.enemy_data[_i] = _data;
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
	
	// for normal enemies, destroy default and create with saved data
	if instance_exists(obj_enemy_parent) {
		instance_destroy(obj_enemy_parent);
	}
	for (var _i = 0; _i < _room_struct.enemy_num; _i++) {
		var _enemy = _room_struct.enemy_data[_i];
		var _obj_index = _enemy.object_type;
		var _inst = instance_create_layer(_enemy.spawn_x, _enemy.spawn_y, "Enemies", _obj_index);
	}
	
}

function save_enemy_init_data() {
	var _room_struct = 0;
	
	// get the correct struct
	if room == rm_tutorial {_room_struct = global.enemy_init_data.tutorial}
	else if room == rm_generator_room {_room_struct = global.enemy_init_data.generator_room}
	else if room == rm_furnace {_room_struct = global.enemy_init_data.furnance}
	
	// already saved, so skip
	if is_struct(_room_struct) {exit;}
	
	var _total_enemy = instance_number(obj_enemy_parent);
	var _room_enemy_struct = {
		total_enemy : _total_enemy,
		all_enemy_data : array_create(_total_enemy),
	}
	
	// save enemies init data
	for (var _i = 0; _i < _total_enemy; _i++) {
		var _inst = instance_find(obj_enemy_parent, _i);
		_room_enemy_struct.all_enemy_data[_i] = {
			respawn_x : _inst.xstart,
			respawn_y : _inst.ystart,
			object_type : _inst.object_index,
		}
	}
	
	// save to specific room
	if room == rm_tutorial {global.enemy_init_data.tutorial = _room_enemy_struct;}
	else if room == rm_generator_room {global.enemy_init_data.generator_room = _room_enemy_struct;}
	else if room == rm_furnace {global.enemy_init_data.furnance = _room_enemy_struct;}
}

function respawn_enemies() {
	
	var _boss_count = instance_number(obj_bigslime);
	for (var _i = 0; _i < _boss_count; _i++) {
		var _inst = instance_find(obj_bigslime, _i);
		var _respawn_x = _inst.xstart;
		var _respawn_y = _inst.ystart;
		var _obj_index = _inst.object_index;
		instance_destroy(_inst);
		instance_create_layer(_respawn_x, _respawn_y, "Enemies", _obj_index);
	}
	
	var _room_struct = 0;
	
	// get the correct struct
	if room == rm_tutorial {_room_struct = global.enemy_init_data.tutorial}
	else if room == rm_generator_room {_room_struct = global.enemy_init_data.generator_room}
	else if room == rm_furnace {_room_struct = global.enemy_init_data.furnance}
	
	// no saved data, exit
	if !is_struct(_room_struct) {exit;}
	
	if instance_exists(obj_enemy_parent) {
		instance_destroy(obj_enemy_parent);
	}
	for (var _i = 0; _i < _room_struct.total_enemy; _i++) {
		var _enemy = _room_struct.all_enemy_data[_i];
		var _obj_index = _enemy.object_type;
		var _inst = instance_create_layer(_enemy.respawn_x, _enemy.respawn_y, "Enemies", _obj_index);
	}
}