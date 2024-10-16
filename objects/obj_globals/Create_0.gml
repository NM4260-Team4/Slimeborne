global.default_hp = 3;
global.max_attachments = 5;
global.max_accessories = 10;
global.max_acc_equipped = 3;

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
	attachments: array_create(global.max_attachments),
	accessories: array_create(global.max_accessories)
}

global.equipped = {
	has_attachment : false,
	equipped_attachment : -1,
	equipped_accessories : array_create(global.max_acc_equipped)
}

// Disable all of the attachment layers on creation
attack_seq = sequence_get(seq_player_attack);
for (var _i = 7; _i > 2; _i--) {
	attack_seq.tracks[_i].enabled = false;
}

global.attachments = [];
global.equipped_attachment = -1;
equipped_attachment_pos = -1;

// Function to add a new attachment
global.add_attachment = function(_attachment) {
	// Add attachment to the array
	array_push(global.attachments, _attachment);
	equipped_attachment_pos = array_length(global.attachments) - 1;
	
	// Disable the previous attachment
	if (global.equipped_attachment != -1) {
		attack_seq.tracks[global.equipped_attachment.attach_id].enabled = false;
		attack_seq.tracks[global.equipped_attachment.hitbox_id].enabled = false;
	}
	
	// Enable the new attachment
	global.equipped_attachment = _attachment;
	attack_seq.tracks[_attachment.attach_id].enabled = true;
	attack_seq.tracks[_attachment.hitbox_id].enabled = true;
}

global.get_next_attachment = function() {
	equipped_attachment_pos = (equipped_attachment_pos + 1) % array_length(global.attachments);
	attack_seq.tracks[global.equipped_attachment.attach_id].enabled = false;
	attack_seq.tracks[global.equipped_attachment.hitbox_id].enabled = false;
	
	global.equipped_attachment = global.attachments[equipped_attachment_pos];
	attack_seq.tracks[global.equipped_attachment.attach_id].enabled = true;
	attack_seq.tracks[global.equipped_attachment.hitbox_id].enabled = true;
	return global.equipped_attachment;
}

