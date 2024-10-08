draw_set_font(fnt_in_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (show_prompt) {
	draw_text(x, y - 200, "Press E to save");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
