if (is_hit or no_hurt_frames > 0) {
	exit; 
} else if (global.equipped.equipped_attachment == obj_battery_attach) {
	hp == 0;
} else {
	hp -= 1;
	is_hit = true;
	no_hurt_frames = 20;
}
