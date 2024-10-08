if (!instance_exists(obj_player)) {
	exit;
}

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, 0, 300, 160, false);
draw_set_alpha(1);
draw_set_color(c_white);

draw_text(x + 20, y + 20, "Max HP: " + string(obj_player.max_hp));
draw_text(x + 20, y + 80, "HP: " + string(obj_player.hp));
