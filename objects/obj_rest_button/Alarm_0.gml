event_inherited();
obj_game_manager.paused = false;
instance_activate_all();
respawn_enemies();
layer_sequence_destroy(obj_game_manager.active_seq);
obj_player.hp = obj_player.max_hp;
save_game(true);
