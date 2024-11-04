/// @description Insert description here
// You can write your code in this editor

// invincible frame
if (is_hit or no_hurt_frames > 0) {
	exit; 
} else {
	if (global.equipped.equipped_attachment == obj_hammer_attach) {
		hp -= 2
	} else {
		hp -= 1;
	}
	is_hit = true;
	no_hurt_frames = 5;
}
