if (!instance_exists(obj_player)) {exit;}

if (place_meeting(x, y, obj_player)) {
	obj_player.hp = 0;
}
