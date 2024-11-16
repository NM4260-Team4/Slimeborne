draw_self();

draw_set_font(fnt_in_game);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(x, y, button_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_in_game);