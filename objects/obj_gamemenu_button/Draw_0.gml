if is_hovered {
	draw_self();
}

draw_set_font(fnt_menu);
draw_set_halign(fa_right)
draw_set_valign(fa_middle);

draw_text(x, y, button_text);

draw_set_valign(fa_top);
draw_set_font(fnt_in_game);