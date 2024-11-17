if (sprite_index == spr_bigslime_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	//instance_create_layer(x, y - 80, "Instances", obj_hammer);
	global.add_attachment(instance_create_layer(0, 0, "Attachments", obj_hammer_attach));
	obj_game_manager.draw_paused(seq_bigslime_death_ui);
	save_game(false);
}

if (sprite_index == spr_bigslime_break) {
	change_state(BOSS_STATE.TARGETING);
}

