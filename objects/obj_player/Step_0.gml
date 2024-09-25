// y movement
y_speed += grav;

// y collision
var _sub_pixel = 0.5;
if place_meeting( x, y + y_speed, obj_tile) {
	var _pixel_check = _sub_pixel * sign(y_speed);
	while !place_meeting(x, y + _pixel_check, obj_tile) {
		y += _pixel_check;
	}
	y_speed = 0;
}

y += y_speed;
