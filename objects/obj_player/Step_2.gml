// respawn
if (hp <= 0) {
	// TODO: play death animation and add black out
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	// load_game();
	if (global.equipped.has_attachment) {
		global.equipped_attachment.visible = false;
	}
	global.player_state.hp = global.player_state.max_hp;
	var _respawn_x = global.player_state.respawn_x;
	var _respawn_y = global.player_state.respawn_y;

	instance_create_layer(_respawn_x, _respawn_y, "Instances", obj_player);
}
