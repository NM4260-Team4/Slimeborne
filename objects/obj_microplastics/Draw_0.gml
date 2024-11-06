if (not sequence_exists(seq_shop)) {
	exit;
}

draw_self();

draw_set_valign(fa_middle);
draw_text(x + 20, y, string(global.player_state.microplastics));
if draw_increment {
	draw_set_color(c_orange);
	if (num_to_increment >= 0) {
		draw_text(x + 20, y + 50, "+" + string(num_to_increment));
	} else {
		draw_text(x + 20, y + 50, "-" + string(abs(num_to_increment)));
	}
	
	draw_set_color(c_white)
}
draw_set_valign(fa_top);
