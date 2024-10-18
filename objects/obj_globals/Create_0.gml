global.default_hp = 3;
global.max_attachments = 5;
global.max_accessories = 10;
global.max_acc_equipped = 3;

global.room_data = {
	tutorial : 0,
	generator_room : 0
}

global.player_state = {
	max_hp : global.default_hp,
	hp : global.default_hp,
	microplastics : 0,
	current_room : "rm_tutorial",
	respawn_x : -1,
	respawn_y : -1
}

global.inventory = {
	num_attachments: 0,
	num_accessories: 0,
	attachments:[], // array_create(global.max_attachments),
	accessories: array_create(global.max_accessories)
}

global.equipped = {
	has_attachment : false,
	equipped_attachment : -1,
	equipped_attachment_pos : -1,
	equipped_accessories : array_create(global.max_acc_equipped)
}

// Disable all of the attachment layers on creation
attack_seq = sequence_get(seq_player_attack);
for (var _i = 5; _i > 2; _i--) {
	attack_seq.tracks[_i].enabled = false;
}

// Function to add a new attachment
global.add_attachment = function(_attachment) {
	// Add attachment to the array
	array_push(global.inventory.attachments, _attachment);
	global.inventory.num_attachments += 1;
	global.equipped.equipped_attachment_pos = global.inventory.num_attachments - 1;
	
	// Disable the previous attachment
	if (global.equipped.has_attachment != false) {
		attack_seq.tracks[global.equipped.equipped_attachment.attach_id].enabled = false;
	} else {
		global.equipped.has_attachment = true;
	}
	
	// Enable the new attachment
	global.equipped.equipped_attachment = _attachment;
	attack_seq.tracks[_attachment.attach_id].enabled = true;
}

global.get_next_attachment = function() {
	attack_seq.tracks[global.equipped.equipped_attachment.attach_id].enabled = false;
	global.equipped.equipped_attachment_pos = (global.equipped.equipped_attachment_pos + 1) % global.inventory.num_attachments;
	
	
	global.equipped.equipped_attachment = global.inventory.attachments[global.equipped.equipped_attachment_pos];
	attack_seq.tracks[global.equipped.equipped_attachment.attach_id].enabled = true;
}

