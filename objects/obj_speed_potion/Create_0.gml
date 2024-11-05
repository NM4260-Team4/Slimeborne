/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function buy() {
	if (global.inventory.num_speed_potions < 3) {
		global.inventory.num_speed_potions++; 
		return true;
	} else {
		return false;
	}
}

function use() {
	return;
}
