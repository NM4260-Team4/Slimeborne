move_dir = -1;
x_speed = move_dir * move_speed;

// x collision
var _sub_pixel = 0.5;
if place_meeting( x + x_speed, y, obj_tile) {
	var _pixel_check = _sub_pixel * sign(x_speed);
	while !place_meeting(x + _pixel_check, y, obj_tile) {
		x += _pixel_check;
	}
	x_speed = 0;
}

x += x_speed;
