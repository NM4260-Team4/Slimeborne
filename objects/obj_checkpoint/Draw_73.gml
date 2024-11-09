draw_set_font(fnt_in_game);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_orange);

if (show_prompt) {
	draw_text(x, y - 400, "Press E to interact");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
