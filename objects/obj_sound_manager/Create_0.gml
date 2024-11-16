function play_background_music(_snd) {
	if (!audio_is_playing(_snd)) {
		audio_play_sound(_snd, 0, true, 1, 3);
		audio_sound_gain(_snd, 0, 0);
		audio_sound_gain(_snd, 1, 5000);
	}
}

function stop_background_music(_snd) {
	audio_stop_sound(_snd);
}

function swap_to_music(_next_music) {
	if (audio_is_playing(background_music)) {
		stop_background_music(background_music);
	}
	play_background_music(_next_music);
}

function swap_back_music(_current_music) {
	if (audio_is_playing(_current_music)) {
		stop_background_music(_current_music);
	}
	play_background_music(background_music);
}
