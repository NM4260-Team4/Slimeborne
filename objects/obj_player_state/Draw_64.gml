if (!instance_exists(obj_player)) {
	exit;
}

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, 0, 300, 160, false);
draw_set_alpha(1);
draw_set_color(c_white);

var _distance = 20;
for (var _i = 0; _i < obj_player.max_hp; _i++) {
	if (_i < obj_player.hp) {
		draw_sprite(spr_heart, 0, x + 20 + (sprite_get_width(spr_heart) + 10)*_i, y + 20);
	} else {
		draw_sprite(spr_heart, 1, x + 20 + (sprite_get_width(spr_heart) + 10)*_i, y + 20);
	}
	
}
