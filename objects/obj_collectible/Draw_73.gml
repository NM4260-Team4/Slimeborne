draw_set_font(fnt_in_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_orange);

if (show_prompt) {
	draw_text(x, y - 224, "Press E to collect");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
