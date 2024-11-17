/// @description Insert description here
// You can write your code in this editor

// invincible frame
if (no_hurt_frames > 0) {
	exit; 
} else {
	hp -= 1;
	if (not is_stumbled) {
		damage_dealt += 1;
	} 
	audio_play_sound(snd_bigslime_hit, 10, false);
	if (damage_dealt % 4 == 0 and not is_stumbled) {
		is_stumbled = true;
		damage_dealt = 0;
	} 
	no_hurt_frames = 20;
}
