num_to_increment = 0;
draw_increment = false;
function add_microplastics(_num) {
	global.player_state.microplastics += _num;
	num_to_increment += _num;
	alarm[0] = 100;
	draw_increment = true;
}

