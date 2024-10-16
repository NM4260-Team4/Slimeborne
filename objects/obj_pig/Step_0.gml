/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(obj_player) < 20) and (!attached) {
	if keyboard_check(ord("E")) {
		obj_player.add_attachment(self);
		attached = true;
		instance_destroy();
	}
	show_prompt = true;
	sprite_index = spr_hovered;
} else {
	show_prompt = false;
	sprite_index = spr_reg;
}