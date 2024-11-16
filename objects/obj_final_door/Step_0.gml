if (!instance_exists(obj_player) or !instance_exists(obj_instruction)) {exit;}

if (distance_to_object(obj_player) < 64) {
	
	show_prompt = true;
	if (obj_instruction.instruction_text != "You need a power core to unlock the door") {
		obj_instruction.instruction_text = "Press E to interact";
	}
	
	if keyboard_check(ord("E")) {
		if (global.player_state.has_final_access) {
			activated = true;
			interacted = true;
			image_index = 1;
		} else {
			obj_instruction.instruction_text = "You need a power core to unlock the door";
		}
	}

} else {
	if (show_prompt) {
		obj_instruction.instruction_text = "";
	}
	show_prompt = false;
}

if (activated) {
	if (initial_y - sprite_height - 64 < y) {
		y -= 4;
	}
}
