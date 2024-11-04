if (!instance_exists(obj_player)) {
	exit;
}

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, 0, (sprite_get_width(spr_heart) + 20) * obj_player.max_hp, 120, false);
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

var _width = display_get_gui_width();
var _height = display_get_gui_height()
draw_rectangle(_width - 200, _height -200, _width - 70, _height - 70, 1);
draw_rectangle(_width - 210, _height -210, _width - 60, _height - 60, 1);
if (global.equipped.has_attachment) {
	draw_sprite(global.equipped_attachment.sprite_index, 0, _width - 135, _height - 135);
}

draw_rectangle(200, _height -200, 70, _height - 70, 1);
draw_rectangle(210, _height -210, 60, _height - 60, 1);