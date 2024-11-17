// invincible frame
if (no_hurt_frames > 0) {
	exit; 
} else {
	if (global.equipped.equipped_attachment == weakness) {
		hp -= 2;
		if (not is_stumbled) {
			damage_dealt += 2;
		} 
		if layer_sequence_exists(weakness_layer, weak_sequence) {
			layer_sequence_destroy(weak_sequence);
		}
		weak_sequence = layer_sequence_create(weakness_layer, x, y - 20, seq_weak);
	} else {
		hp -= 1;
		if (not is_stumbled) {
			damage_dealt += 1;
		} 
	}

	audio_play_sound(snd_elecboss_hit, 10, false);
	if (damage_dealt % 5 == 0 and not is_stumbled) {
		is_stumbled = true;
		no_hurt_frames = 20;
		damage_dealt = 0;
	} else {
		no_hurt_frames = 20;
	}
}