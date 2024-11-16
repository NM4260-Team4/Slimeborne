/// @description Insert description here
// You can write your code in this editor

// invincible frame
if (is_hit or no_hurt_frames > 0) {
	exit; 
} else {
	if (global.equipped.equipped_attachment == weakness) {
		hp -= 2;
		if layer_sequence_exists(layer, weak_sequence) {
			layer_sequence_destroy(weak_sequence);
		}
		weak_sequence = layer_sequence_create(layer, x, y, seq_weak);
	} else {
		hp -= 1;
	}
	is_hit = true;
	no_hurt_frames = 5;
}
