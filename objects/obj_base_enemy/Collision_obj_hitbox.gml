/// @description Insert description here
// You can write your code in this editor

// invincible frame
if (no_hurt_frames <= 0) {
	max_health -= 1;
	no_hurt_frames = 60;
}

if max_health <= 0 {
	instance_destroy();
}