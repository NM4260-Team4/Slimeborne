/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obj_game_manager.paused = false;
instance_activate_all();
layer_sequence_destroy(obj_game_manager.pause_seq);