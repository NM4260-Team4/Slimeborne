/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(obj_player) < 20) {
	if keyboard_check(ord("E")) {
		global.add_attachment(instance_create_layer(0, 0, "Attachments", obj_attachment));
		save_game(true);
		instance_destroy();
	}
	show_prompt = true;
	sprite_index = spr_hovered;
} else {
	show_prompt = false;
	sprite_index = spr_reg;
}