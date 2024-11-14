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
// Counting timers
if (attack_cooldown > 0) {
	attack_cooldown--;
}


// State handling
switch state {
	case BOSS_STATE.IDLE: 
		if (inner_state == 0) {
			sprite_index = spr_finalboss_idle;
			inner_state = 1
			move_speed = 0;
		} else if (inner_state == 1) {
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (point_distance(x, y, obj_player.x, obj_player.y) < 1000) {
				change_state(BOSS_STATE.TARGETING);
				break;
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.TARGETING:
		if (inner_state == 0) {
			// Set up for the next state
			sprite_index = spr_finalboss_idle;
			inner_state = 1;
			move_speed = 2;
			move_dir = 1
		} else if (inner_state == 1) {
			// When the boss is dead, swap states
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			
			// If too far away, switch back to roaming
			if (point_distance(x, y, obj_player.x, obj_player.y) >= 2000) {
				change_state(BOSS_STATE.IDLE);
				break;
			}
			

			// Check if player has entered attack range
			if (abs(x - obj_player.x) < 500 and attack_cooldown == 0) {
				var _range = 1;
				// Check which attack ranges the player is in
				if (x - obj_player.x < 450) {
					_range = 2;
				} 
				if (abs(x - obj_player.x) < 70) {
					_range = 3;
				}
				var _choice = irandom(_range);
				show_debug_message("Chosen attack:" + string(_choice))
				show_debug_message("Range:" + string(_range))
				show_debug_message("Distance:" + string(abs(x - obj_player.x)))
				change_state(attacks[_choice]);
			}
			// Attack distance			
			if (x - obj_player.x >= 70) {
				move_dir = -1;
				move_speed = 2;
			} else if (obj_player.x - x >= 70){
				move_dir = 1;
				move_speed = 2;
			} else {
				move_speed = 0;
			}
			
			var _right_has_block = not position_meeting(bbox_right, bbox_bottom + 1, all_collidables[0]) or position_meeting(bbox_right + 2, bbox_bottom - 1, all_collidables);
			var _left_has_block =  not position_meeting(bbox_left, bbox_bottom + 1, all_collidables[0]) or position_meeting(bbox_left - 2, bbox_bottom -1 , all_collidables);
			if (_right_has_block and move_dir > 0) or (_left_has_block and move_dir < 0) {
				move_speed = 0;
			}
			
			move_x = move_speed * move_dir;
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	
	case BOSS_STATE.ATTACK1:
		if (inner_state == 0) {
			start_animation(seq_finalboss_elec_attack);
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			check_animation(is_stumbled or hp <= 0);
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (enabled) {
				attack_cooldown = 30;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.ATTACK2:
		if (inner_state == 0) {
			start_animation(seq_finalboss_fire_attack);
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			check_animation(is_stumbled or hp <= 0);
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (enabled) {
				attack_cooldown = 30;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.ATTACK3:
		if (inner_state == 0) {
			start_animation(seq_finalboss_head_attack);
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			check_animation(is_stumbled or hp <= 0);
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (enabled) {
				attack_cooldown = 30;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.DEATH:
		if (inner_state == 0) {
			sprite_index = spr_finalboss_death;
			image_index = 0;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
		}
		break;
}

