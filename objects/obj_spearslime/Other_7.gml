if (sprite_index == spr_spearslime_death) {
	instance_destroy();
	obj_currency.add_microplastics(10);
}

if (sprite_index == spr_spearslime_hit) {
	change_state(SLIMEENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}