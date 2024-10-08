// x movement
var _move_count = abs(move_x);
repeat (_move_count) {
	
}

// y movement
move_y += grav;

// y collision
var _sub_pixel = 1;
if place_meeting( x, y + move_y, all_collidables) {
	var _pixel_check = _sub_pixel * sign(move_y);
	while !place_meeting(x, y + _pixel_check, all_collidables) {
		y += _pixel_check;
	}
	move_y = 0;
}

y += move_y;

// Reduce health if touching enemy
if place_meeting(x, y, obj_base_enemy) and no_hurt_frames > 0 {
	hp -= 1;
}

// invincible frame
if (no_hurt_frames > 0) {
	no_hurt_frames --;
}


