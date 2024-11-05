event_inherited();

function buy() {
	if (global.inventory.num_hp_potions < 5) {
		global.inventory.num_hp_potions++; 
		return true;
	} else {
		return false;
	}
}

function use() {
	if (global.inventory.num_hp_potions > 0) {
		obj_player.hp = min(obj_player.hp + 1, obj_player.max_hp);
		global.inventory.num_hp_potions--; 
	}
}

max_amount = 5; 
