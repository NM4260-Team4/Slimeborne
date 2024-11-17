/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hp = 1;
max_hp = 50;
attacks = [BOSS_STATE.ATTACK1, BOSS_STATE.ATTACK2, BOSS_STATE.ATTACK3];
grav = 1;
image_xscale = abs(image_xscale);
weakness = NaN;
weak_sequence = -1;
offset = 0;
weakness_layer = layer_create(depth - 3, "Weakness Layer");
function hit() {
	if (no_hurt_frames > 0) {
		exit; 
	} else {
		if (global.equipped.equipped_attachment == weakness) {
			hp -= 2;
			if layer_sequence_exists(weakness_layer, weak_sequence) {
				layer_sequence_destroy(weak_sequence);
			}
			weak_sequence = layer_sequence_create(weakness_layer, x + offset, y - 10, seq_weak);
		} else {
			hp -= 1;
		}
		audio_play_sound(snd_finalboss_hit, 10, false);
		no_hurt_frames = 20;
	}
}
