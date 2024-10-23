if (sprite_index == spr_spearslime_death) {
	instance_destroy();
}

if (sprite_index == spr_spearslime_hit) {
	change_state(ENEMY_STATE.ROAM);
}