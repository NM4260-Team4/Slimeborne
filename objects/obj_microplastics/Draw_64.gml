if (!instance_exists(obj_player)) {
	exit;
}

draw_self();

draw_set_valign(fa_middle);
draw_text(x + 20, y, string(global.player_state.microplastics));
draw_set_valign(fa_top);
