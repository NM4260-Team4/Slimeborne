if (sprite_index == spr_elecboss_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	save_game(false);
}

if (sprite_index == spr_elecboss_break) {
	change_state(BOSS_STATE.TARGETING);
}

