/// @description Insert description here
// You can write your code in this editor

// invincible frame
if (no_hurt_frames > 0) {
	exit; 
} else {
	if (is_stumbled) {
		hp -= 3;
	} else {
		hp -= 1;
		damage_dealt += 1;
	}
	if (damage_dealt % 4 == 0 and not is_stumbled) {
		is_stumbled = true;
		no_hurt_frames = 20;
		damage_dealt = 0;
	} else {
		no_hurt_frames = 20;
	}
}
