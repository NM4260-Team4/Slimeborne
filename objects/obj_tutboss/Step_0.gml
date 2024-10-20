// y movement
move_y += grav;
// move with y collision
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

// State handling
switch state {
	case BOSS_STATE.ROAM:
		if (inner_state == 0) {
			sprite_index = spr_tutboss_idle;
			inner_state = 1;
		} else if (inner_state == 1) {
			if _on_land {
				swap_direction_on_bump();
				move_x = move_speed * move_dir;
			} 
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
	case BOSS_STATE.TARGETING:
		if (inner_state == 0) {
			sprite_index = spr_tutboss_idle;
			inner_state = 1;
		} else if (inner_state == 1) {
			if _on_land {
				if (x > obj_player.x + 2) {
					move_dir = -1;
				} else if (x <= obj_player.x + 2 and x >= obj_player.x - 2){
					move_dir = 0;
				} else {
					move_dir = 1;
				}
				move_x = move_speed * move_dir;
			} 
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
	
}

