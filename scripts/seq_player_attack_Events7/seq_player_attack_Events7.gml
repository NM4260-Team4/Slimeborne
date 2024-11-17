// Auto-generated stubs for each available event.

function seq_player_attack_Moment()
{
	audio_play_sound(snd_player_attack, 10, false);
}







function play_attachment_sound()
{
	if global.equipped.equipped_attachment == obj_coal_attach {
		audio_play_sound(snd_coal, 10, false);
	} else if global.equipped.equipped_attachment == obj_battery_attach {
		audio_play_sound(snd_battery, 10, false, 1, 0.3);
	}
}