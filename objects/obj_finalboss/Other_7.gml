if (sprite_index == spr_finalboss_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	if layer_sequence_exists(weakness_layer, weak_sequence) {
		layer_sequence_destroy(weak_sequence);
	}
	save_game(false);
	obj_game_manager.draw_paused(seq_finalboss_death_ui)
}

