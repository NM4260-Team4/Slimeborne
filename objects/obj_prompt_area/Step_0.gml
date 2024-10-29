if (!instance_exists(obj_player)) {exit;}

if (!instance_exists(obj_instruction)) {exit;}

if (place_meeting(x, y, obj_player)) {
	colliding = true;
	obj_instruction.instruction_text = prompt;
} else {
	if (colliding) {
		obj_instruction.instruction_text = "";
		colliding = false;
	}
}
