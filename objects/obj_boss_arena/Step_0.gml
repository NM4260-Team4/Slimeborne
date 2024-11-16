if (!instance_exists(obj_player) or !instance_exists(obj_bigslime)) {
	if (instance_exists(obj_sound_manager)) {
		obj_sound_manager.swap_back_music(snd_boss_fight);
	}
	exit;
}

if (place_meeting(x, y, obj_player)) {
	if (instance_exists(obj_sound_manager)) {
		obj_sound_manager.swap_to_music(snd_boss_fight);
	}
}
