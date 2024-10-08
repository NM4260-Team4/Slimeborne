if (!instance_exists(obj_player)) {
	exit;
}

draw_self();

draw_set_valign(fa_middle);
draw_text(x + 20, y, string(obj_player.microplastics));
draw_set_valign(fa_top);
