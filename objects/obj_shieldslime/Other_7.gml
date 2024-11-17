if (sprite_index == spr_shieldslime_death) {
	instance_destroy();
	obj_currency.add_microplastics(20);
	if layer_sequence_exists(layer, weak_sequence) {
		layer_sequence_destroy(weak_sequence);
	}
}

if (sprite_index == spr_shieldslime_hit) {
	change_state(SLIMEENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}