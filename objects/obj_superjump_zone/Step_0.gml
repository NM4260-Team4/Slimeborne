if (place_meeting(x, y, obj_player)) {
	obj_player.jump_speed = buffed_jump;
} else {
	obj_player.jump_speed = -24;
}
