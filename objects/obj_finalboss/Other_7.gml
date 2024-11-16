if (sprite_index == spr_finalboss_death) {
	instance_destroy();
	if (active_sequence != undefined) {
		layer_sequence_destroy(active_sequence);
	}
	instance_create_layer(x, y - 80, "Instances", obj_hammer);
	save_game(false);
}

