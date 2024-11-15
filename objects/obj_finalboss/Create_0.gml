/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attacks = [BOSS_STATE.ATTACK1, BOSS_STATE.ATTACK2, BOSS_STATE.ATTACK3];
grav = 1;
image_xscale = abs(image_xscale);
function hit() {
	if (no_hurt_frames > 0) {
		exit; 
	} else {
		hp -= 1;
		no_hurt_frames = 20;
	}
}