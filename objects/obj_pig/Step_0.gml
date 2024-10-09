/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(obj_player) < 20) {
	if keyboard_check(ord("E")) {
		obj_player.add_attachment(self);
		instance_destroy();
	}
	image_index = 1;
	show_prompt = true

} else {
	image_index = 0;
	show_prompt = false;
}