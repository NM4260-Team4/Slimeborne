load_game();

if (instance_exists(obj_player)) {
	instance_destroy(obj_player);
}

var _respawn_x = global.player_state.respawn_x;
var _respawn_y = global.player_state.respawn_y;

instance_create_layer(_respawn_x, _respawn_y, "Instances", obj_player);

save_game(false);
