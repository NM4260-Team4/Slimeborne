// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bzzz(){
	obj_elecboss.activate_electric_floor();
	audio_play_sound(snd_electric_floor, 10, false);
}

function no_bzzz() {
	obj_elecboss.deactivate_electric_floor();
	audio_stop_sound(snd_electric_floor);
}