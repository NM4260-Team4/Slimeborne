if (!instance_exists(obj_player)) {
	exit;
}

draw_set_font(fnt_in_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_orange);

draw_text(x, y, instruction_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
