// invincible frame
if (no_hurt_frames > 0) {
	exit; 
} else {
	if (is_stumbled) {
		//hp -= 3;
		hp -= 1;
	} else {
		hp -= 1;
		damage_dealt += 1;
	}
	
	if (damage_dealt % 5 == 0 and not is_stumbled) {
		is_stumbled = true;
		no_hurt_frames = 20;
		damage_dealt = 0;
	} else {
		no_hurt_frames = 20;
	}
}