if (!instance_exists(obj_player)) {
	exit;
}

if obj_player.effect_timer > 0 {
	draw_sprite(spr_speed, 0, x + 50, y + 54 + sprite_get_height(spr_heart))
	draw_set_font(fnt_gamemenu);
	draw_set_valign(fa_middle);

	draw_text(x + 100, y + 40 + sprite_get_height(spr_heart), "0:" + string(floor(obj_player.effect_timer / game_get_speed(gamespeed_fps))));

	draw_set_valign(fa_top);
	draw_set_font(fnt_in_game);
}

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
draw_rectangle_color(_width - 210, _height -210, _width - 60, _height - 60, c_white,c_white,c_white, c_white, 0);
draw_rectangle_color(_width - 200, _height -200, _width -70, _height - 70, c_gray,c_gray,c_gray, c_gray, 0);
if (global.equipped.has_attachment) {
	draw_sprite(global.equipped_attachment.sprite_index, 0, _width - 135, _height - 135);
}
