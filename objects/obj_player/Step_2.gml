// respawn
if (hp <= 0) {
	// TODO: play death animation and add black out
	load_game();
	instance_destroy();
	global.player_state.hp = global.player_state.max_hp;
	var _respawn_x = global.player_state.respawn_x;
	var _respawn_y = global.player_state.respawn_y;

	instance_create_layer(_respawn_x, _respawn_y, "Instances", obj_player);
}
