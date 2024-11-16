if (!instance_exists(obj_player)) {
	exit;
}
var _height = display_get_gui_height();
draw_set_alpha(1);
draw_set_color(c_white);
//draw_rectangle_color(230, _height -230, 40, _height - 40, #4A5368, #4A5368, #4A5368, #4A5368, 0);
draw_roundrect_color_ext(225, _height -230, 41, _height - 43, 50, 50, #4A5368, #4A5368, 0);
draw_sprite(available_potions[current_potion].sprite_index, 0, 135, _height - 135);
draw_sprite_ext(spr_frame, -1, 135, _height - 135, 0.3, 0.3, 0, c_white, 1);
draw_set_font(fnt_gamemenu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(165, _height - 110, string(available_potions[current_potion].count) + "/" + string(available_potions[current_potion].max_amount), 0.7, 0.7, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_in_game);