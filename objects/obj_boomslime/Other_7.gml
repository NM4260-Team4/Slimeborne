if (sprite_index == spr_boomslime_death) {
	instance_destroy();
	obj_microplastics.add_microplastics(10);
}

if (sprite_index == spr_boomslime_hit) {
	change_state(SLIMEENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}