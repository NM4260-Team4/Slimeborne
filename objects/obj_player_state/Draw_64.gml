if (!instance_exists(obj_player)) {
	exit;
}

if obj_player.effect_timer > 0 {
	draw_sprite(spr_speed, 0, x + 50, y + 54 + sprite_get_height(spr_heart))
	draw_set_font(fnt_in_game);
	draw_set_valign(fa_middle);

	draw_text(x + 100, y + 40 + sprite_get_height(spr_heart), "0:" + string(floor(obj_player.effect_timer / game_get_speed(gamespeed_fps))));

	draw_set_valign(fa_top);
	draw_set_font(fnt_in_game);
}

var _distance = 20;
for (var _i = 0; _i < obj_player.max_hp; _i++) {
	if (_i < obj_player.hp) {
		draw_sprite(spr_heart, 0, x + 40 + (sprite_get_width(spr_heart) + 20)*_i, y + 30);
	} else {
		draw_sprite(spr_heart, 1, x + 40 + (sprite_get_width(spr_heart) + 20)*_i, y + 30);
	}
}

var _width = display_get_gui_width();
var _height = display_get_gui_height()
//draw_rectangle_color(230, _height -230, 40, _height - 40, #4A5368, #4A5368, #4A5368, #4A5368, 0);
draw_roundrect_color_ext(_width - 228, _height -230, _width - 46, _height - 46, 50, 50, #4A5368, #4A5368, 0);
draw_sprite_ext(spr_frame, -1,_width - 135, _height - 135, 0.3, 0.3, 0, c_white, 1);
if (global.equipped.has_attachment) {
	draw_sprite(global.equipped_attachment.sprite_index, 0, _width - 135, _height - 135);
}
