/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_elecslime_death) {
	instance_destroy();
	obj_currency.add_microplastics(7);
}

if (sprite_index == spr_elecslime_hit) {
	change_state(ENEMY_STATE.ROAM);
	no_hurt_frames = 0;
	is_hit = false;
}