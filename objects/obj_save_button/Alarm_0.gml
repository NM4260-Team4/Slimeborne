event_inherited();
obj_game_manager.paused = false;
instance_activate_all();
layer_sequence_destroy(obj_game_manager.active_seq);
obj_player.hp = obj_player.max_hp;
obj_game_manager.curr_checkpoint.interacted = true;
save_game(true);
