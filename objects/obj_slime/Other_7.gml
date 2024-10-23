if (sprite_index == spr_slime_death) {
	instance_destroy();
}

if (sprite_index == spr_slime_hurt) {
	change_state(ENEMY_STATE.ROAM);
}