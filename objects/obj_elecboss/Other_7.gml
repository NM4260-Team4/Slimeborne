if (sprite_index == spr_elecboss_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	deactivate_electric_floor();
	save_game(true);
	global.player_state.has_final_access = true;
	obj_game_manager.draw_paused(seq_bigslime_death_ui);
}

if (sprite_index == spr_elecboss_break) {
	change_state(BOSS_STATE.TARGETING);
}

