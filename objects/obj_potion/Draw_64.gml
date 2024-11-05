if (!instance_exists(obj_player)) {
	exit;
}
var _height = display_get_gui_height();
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle_color(210, _height -210, 60, _height - 60, c_white,c_white,c_white, c_white, 0);
draw_rectangle_color(200, _height -200, 70, _height - 70, c_gray,c_gray,c_gray, c_gray, 0);
draw_sprite(available_potions[current_potion].sprite_index, 0, 135, _height - 135);

draw_set_font(fnt_gamemenu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(165, _height - 110, string(available_potions[current_potion].count) + "/" + string(available_potions[current_potion].max_amount), 0.7, 0.7, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_in_game);