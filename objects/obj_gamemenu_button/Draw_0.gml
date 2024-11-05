if is_hovered {
	draw_self();
}

draw_set_font(fnt_menu);
draw_set_halign(fa_left)
draw_set_valign(fa_middle);

draw_text(bbox_left + 2, y, button_text);

draw_set_valign(fa_top);
draw_set_font(fnt_in_game);