if (sprite_index == spr_bigslime_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	instance_create_layer(x, y - 80, "Instances", obj_hammer);
	save_game(false);
}

if (sprite_index == spr_bigslime_break) {
	change_state(BOSS_STATE.TARGETING);
}

