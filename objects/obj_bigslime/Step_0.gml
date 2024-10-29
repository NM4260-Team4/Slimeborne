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
	case BOSS_STATE.IDLE: 
		if (inner_state == 0) {
			sprite_index = spr_bigslime_idle;
			inner_state = 1
			move_speed = 0;
		} else if (inner_state == 1) {
			if (point_distance(x, y, obj_player.x, obj_player.y) < 300) {
				change_state(BOSS_STATE.TARGETING);
				break;
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.ROAM:
		if (inner_state == 0) {
			sprite_index = spr_bigslime_idle;
			inner_state = 1
			move_speed = 2;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp == 0) {
					change_state(BOSS_STATE.DEATH);
					break;
				}
				change_state(BOSS_STATE.BREAK);
				break;
			}
			
			if (abs(x - obj_player.x) < 400 and abs(y - obj_player.y) < 50) {
				change_state(BOSS_STATE.TARGETING);
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
	case BOSS_STATE.TARGETING:
		if (inner_state == 0) {
			sprite_index = spr_bigslime_idle;
			inner_state = 1;
			move_speed = 2;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp == 0) {
					change_state(BOSS_STATE.DEATH);
					break;
				}
				change_state(BOSS_STATE.BREAK);
				break;
			}
			if (abs(x - obj_player.x) >= 400 or abs(y - obj_player.y) > 50) {
				change_state(BOSS_STATE.ROAM);
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
	
	case BOSS_STATE.BASE_ATTACK:
		if (inner_state == 0) {
			start_animation(seq_tutboss_base_attack);
			inner_state = 1;
		} else if (inner_state == 1) {
			check_animation(is_stumbled);
			if (enabled) {
				attack_cooldown = 30;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.SWEEP_ATTACK:
		if (inner_state == 0) {
			image_xscale = -image_xscale;
			start_animation(seq_tutboss_sweep_attack);
			inner_state = 1;
		} else if (inner_state == 1) {
			check_animation(is_stumbled);
			if (enabled) {
				image_xscale = -image_xscale;
				attack_cooldown = 30;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.BREAK:
		if (inner_state == 0) {
			sprite_index = spr_tutboss_break;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			break_frames--;
			if (break_frames == 0) {
				change_state(BOSS_STATE.TARGETING);
				is_stumbled = false
			} 
		} else {
			state = next_state;
			inner_state = 0;
		}
	case BOSS_STATE.DEATH:
		if (inner_state == 0) {
			sprite_index = spr_slime_death;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
		}
		break;
}

