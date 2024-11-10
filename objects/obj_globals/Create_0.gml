global.overlay_sequence = -1;
global.default_hp = 3;
global.max_attachments = 5;
global.max_accessories = 10;
global.max_acc_equipped = 3;

global.enemy_init_data = {
	tutorial : 0,
	generator_room : 0,
	furnance: 0
}

global.room_data = {
	tutorial : 0,
	generator_room : 0,
	furnance: 0
}

global.player_state = {
	max_hp : global.default_hp,
	hp : global.default_hp,
	microplastics : 0,
	current_room : "rm_tutorial",
	respawn_x : -1,
	respawn_y : -1,
	has_final_access : false
}

global.inventory = {
	num_attachments: 0,
	num_accessories: 0,
	num_hp_potions: 0,
	num_speed_potions: 0,
	attachments:[], // array_create(global.max_attachments),
	accessories: array_create(global.max_accessories)
}

global.equipped = {
	has_attachment : false,
	swap_prompt_shown: false,
	equipped_attachment : -1,
	equipped_attachment_pos : -1,
	equipped_accessories : array_create(global.max_acc_equipped)
}

// Temporary variables for room use
global.equipped_attachment = -1;
global.attachments = [];
global.available_potions = [];
global.current_potion_pos = 0;

// Function to add a new attachment
global.add_attachment = function(_attachment) {
	// Add attachment to the array	
	array_push(global.attachments, _attachment);
	array_push(global.inventory.attachments, _attachment.object_index);
	
	global.inventory.num_attachments += 1;
	global.equipped.equipped_attachment_pos = global.inventory.num_attachments - 1;
	
	// Disable the previous attachment
	if (global.equipped.has_attachment == false) {
		global.equipped.has_attachment = true;
	}
	
	// Enable the new attachment
	global.equipped_attachment = _attachment;
	global.equipped.equipped_attachment = _attachment.object_index;
}

global.get_next_attachment = function() {
	global.equipped.equipped_attachment_pos = (global.equipped.equipped_attachment_pos + 1) % global.inventory.num_attachments;
	global.equipped_attachment = global.attachments[global.equipped.equipped_attachment_pos];
	global.equipped.equipped_attachment = global.equipped_attachment.object_index;
}

