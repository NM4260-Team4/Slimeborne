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
	if (global.inventory.num_speed_potions > 0) {
		obj_player.move_speed = 100;
		global.inventory.num_speed_potions--;
		obj_player.effect_timer = game_get_speed(gamespeed_fps) * 30;
	}
}

max_amount = 3;