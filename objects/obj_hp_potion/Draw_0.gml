draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(bbox_right + 35, bbox_bottom + 30, string(global.inventory.num_hp_potions) + "/5");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_in_game);