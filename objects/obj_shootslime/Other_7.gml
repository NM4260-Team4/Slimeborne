if (sprite_index == spr_shootslime_death) {
	instance_destroy();
	obj_currency.add_microplastics(15);
	if layer_sequence_exists(layer, weak_sequence) {
		layer_sequence_destroy(weak_sequence);
	}
}

if (sprite_index == spr_shootslime_attack) {
	instance_create_layer(x + 30 * move_dir, y - 80, layer, obj_laser);
	audio_play_sound(snd_shootslime_laser, 10, false, 1,  0.09);
	attack_cooldown = 90;
	change_state(SLIMEENEMY_STATE.TARGETING);
}
if (sprite_index == spr_shootslime_hit) {
	change_state(SLIMEENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}