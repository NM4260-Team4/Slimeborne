move_dir = 1;
move_x = move_dir * move_speed;

// x collision
var _sub_pixel = 1;
if place_meeting( x + move_x, y, all_collidables) {
	var _pixel_check = _sub_pixel * sign(move_x);
	while !place_meeting(x + _pixel_check, y, all_collidables) {
		x += _pixel_check;
	}
	move_x = 0;
}

x += move_x;

if (grounded) {
	sprite_index = spr_player_move;
}
