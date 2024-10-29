/// @description Insert description here
// You can write your code in this editor

// invincible frame
if (is_hit or no_hurt_frames > 0) {
	exit; 
} else {
	hp -= 1;
	is_hit = true;
}
