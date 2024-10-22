/// @description Insert description here
if (no_hurt_frames > 0 or is_hit) {
	exit; 
} else {
	hp -= 1;
	no_hurt_frames = 10;
	if (hp < max_hp and hp % 3 == 0) {
		is_stumbled = true;
		break_frames = 60;
	}
	if (hp == 0) {
		instance_destroy();
	}
}
