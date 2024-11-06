draw_self();

draw_set_font(fnt_gamemenu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(bbox_right, bbox_bottom, string(global.inventory.num_speed_potions) + "/3");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_in_game);