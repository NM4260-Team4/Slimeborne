if (sprite_index == spr_shootslime_death) {
	instance_destroy();
}

if (sprite_index == spr_shootslime_attack) {
	instance_create_layer(x + 30 * move_dir, y - 80, layer, obj_lazer);
	attack_cooldown = 90;
	change_state(SLIMEENEMY_STATE.TARGETING);
}
if (sprite_index == spr_shootslime_hit) {
	change_state(SLIMEENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}