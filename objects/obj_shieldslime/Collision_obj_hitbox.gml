
if (is_hit or no_hurt_frames > 0) {
	exit; 
} else {
	if (global.equipped.equipped_attachment == weakness) {
		hp -= 2;
		if layer_sequence_exists(layer, weak_sequence) {
			layer_sequence_destroy(weak_sequence);
		}
		weak_sequence = layer_sequence_create(layer, x, y - sprite_height/2, seq_weak);
	} else {
		hp -= 1;
	}
	is_hit = true;
	no_hurt_frames = 20;
}

//else if (global.equipped.equipped_attachment == obj_hammer_attach){
//	hp -= 2;
//	is_hit = true;
//	no_hurt_frames = 20;
//}
