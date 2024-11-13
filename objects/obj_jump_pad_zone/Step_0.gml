if (!instance_exists(obj_player)) {exit;}

if (place_meeting(x, y, obj_player)) {
	
	obj_player.auto_jump = true;
	obj_player.move_y = height_added;
	obj_player.change_state(PLAYER_STATE.JUMP);
	
	trigger_jump_pad();
	
} 