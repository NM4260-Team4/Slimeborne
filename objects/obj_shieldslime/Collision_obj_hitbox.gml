
if (is_hit or no_hurt_frames > 0) {
	exit; 
} else if (global.equipped.equipped_attachment == obj_hammer_attach){
	hp -= 2;
	is_hit = true;
	no_hurt_frames = 20;
}
