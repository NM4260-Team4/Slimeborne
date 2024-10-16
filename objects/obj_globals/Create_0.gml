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
	attachments: array_create(global.max_attachments),
	accessories: array_create(global.max_accessories)
}

global.equipped = {
	has_attachment : false,
	equipped_attachment : NaN,
	equipped_accessories : array_create(global.max_acc_equipped)
}
