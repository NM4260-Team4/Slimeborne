// y movement
move_y += grav;
// move with y collision
var _sub_pixel = 1;
var _on_land = false;
if place_meeting(x, y + move_y, all_collidables) {
	_on_land = true;
	var _pixel_check = _sub_pixel * sign(move_y);
	while !place_meeting(x, y + _pixel_check, all_collidables) {
		y += _pixel_check;
	}
	move_y = 0;
}

y += move_y;
// invincible frame
if (no_hurt_frames > 0) {
	no_hurt_frames --;
}

// State handling
switch state {
	case ENEMY_STATE.IDLE: 
		break;
	case ENEMY_STATE.ROAM:
		if (inner_state == 0) {
			sprite_index = spr_slime_move;
			inner_state = 1
			move_speed = 2;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp == 0) {
					change_state(ENEMY_STATE.DEATH);
					break;
				}
				change_state(ENEMY_STATE.HIT);
				break;
			}
			
			if (abs(x - obj_player.x) < 400 and abs(y - obj_player.y) < 50) {
				change_state(ENEMY_STATE.TARGETING);
				break;
			}
			if _on_land {
				swap_direction_on_bump();
				move_x = move_speed * move_dir;
			} 
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case ENEMY_STATE.TARGETING:
		if (inner_state == 0) {
			sprite_index = spr_slime_move;
			inner_state = 1;
			move_speed = 4;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp == 0) {
					change_state(ENEMY_STATE.DEATH);
					break;
				}
				change_state(ENEMY_STATE.HIT);
				break;
			}
			if (abs(x - obj_player.x) >= 400 or abs(y - obj_player.y) > 50) {
				change_state(ENEMY_STATE.ROAM);
				break;
			}
			if (x > obj_player.x) {
				move_dir = -1;
				image_xscale = -1 * abs(image_xscale);
			} else {
				move_dir = 1;
				image_xscale = abs(image_xscale);
			}
			
			var _no_floor = (not position_meeting(bbox_right, bbox_bottom + 1, all_collidables[0]) and move_dir > 0) or (not position_meeting(bbox_left, bbox_bottom + 1, all_collidables[0]) and move_dir < 0);
			var _has_wall = (position_meeting(bbox_right + 2, bbox_top, all_collidables) and move_dir > 0) or (position_meeting(bbox_left - 2, bbox_top, all_collidables) and move_dir < 0);
			if _no_floor or _has_wall {
				move_dir = 0;
			}
			//swap_direction_on_bump();
			move_x = move_speed * move_dir;
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
		
	case ENEMY_STATE.HIT:
		if (inner_state == 0) {
			sprite_index = spr_slime_hit;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
		} else {
			no_hurt_frames = 5;
			is_hit = false;
			state = next_state;
			inner_state = 0;
		}
		break;
	case ENEMY_STATE.DEATH:
		if (inner_state == 0) {
			sprite_index = spr_slime_death;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
		}
		break;
}

