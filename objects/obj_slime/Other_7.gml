if (sprite_index == spr_slime_death) {
	instance_destroy();
	obj_microplastics.add_microplastics(5);
	if layer_sequence_exists(layer, weak_sequence) {
		layer_sequence_destroy(weak_sequence);
	}
}

if (sprite_index == spr_slime_hit) {
	change_state(ENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}