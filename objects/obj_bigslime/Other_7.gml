if (sprite_index == spr_bigslime_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
}

if (sprite_index == spr_bigslime_break) {
	change_state(BOSS_STATE.TARGETING);
	no_hurt_frames = 0;
}

