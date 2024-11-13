// respawn
if (hp <= 0) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	// load_game();
	if (global.equipped.has_attachment) {
		global.equipped_attachment.visible = false;
	}
	global.player_state.hp = global.player_state.max_hp;
	
	instance_create_layer(x, y, "Instances", obj_player_death);
	
}
