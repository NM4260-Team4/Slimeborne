// y movement
move_y += grav;

// y collision
var _sub_pixel = 1;
var _on_land = false;
if place_meeting( x, y + move_y, all_collidables) {
	_on_land = true;
	var _pixel_check = _sub_pixel * sign(move_y);
	while !place_meeting(x, y + _pixel_check, all_collidables) {
		y += _pixel_check;
	}
	move_y = 0;
}

y += move_y;

if _on_land {
	if not position_meeting(x + move_dir * sprite_width/2, y + 1,all_collidables) {
		move_dir = -1 * move_dir
	}
	move_x = move_speed * move_dir;
} 

x += move_x;

if max_health <= 0 {
	instance_destroy();
}