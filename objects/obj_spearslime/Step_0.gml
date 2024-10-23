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

if (attack_cooldown > 0) {
	attack_cooldown--;
}

// State handling
switch state {
	case SLIMEENEMY_STATE.IDLE: 
		break;
	case SLIMEENEMY_STATE.ROAM:
		if (inner_state == 0) {
			sprite_index = spr_spearslime_idle;
			inner_state = 1
			move_speed = 2;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp == 0) {
					change_state(SLIMEENEMY_STATE.DEATH);
					break;
				}
				change_state(SLIMEENEMY_STATE.HIT);
				break;
			}
			
			if (abs(x - obj_player.x) < 1000 and abs(y - obj_player.y) < 500) {
				change_state(SLIMEENEMY_STATE.TARGETING);
				break;
			}
			if _on_land {
				swap_direction_on_bump();
				move_x = move_speed * move_dir;
				show_debug_message("move_x is incremented");
				show_debug_message(move_x);
			} 
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case SLIMEENEMY_STATE.TARGETING:
		if (inner_state == 0) {
			sprite_index = spr_spearslime_idle;
			inner_state = 1;
			move_speed = 6;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp == 0) {
					change_state(SLIMEENEMY_STATE.DEATH);
					break;
				}
				change_state(SLIMEENEMY_STATE.HIT);
				break;
			}
			if (abs(x - obj_player.x) >= 1000 or abs(y - obj_player.y) > 500) {
				change_state(SLIMEENEMY_STATE.ROAM);
				break;
			}

			if (x > obj_player.x) {
				move_dir = -1;
				image_xscale = abs(image_xscale);
			} else {
				move_dir = 1;
				image_xscale = -1 * abs(image_xscale);
			}
			
			if (abs(x - obj_player.x) < 300 and abs(x - obj_player.x) > 200) {
				if (attack_cooldown == 0) {
					change_state(SLIMEENEMY_STATE.ATTACK);
				}
				break;
			} else if (abs(x - obj_player.x) <= 200) {
				if (x > obj_player.x) {
					move_dir = 1;
					image_xscale = -1;
				} else {
					move_dir = -1;
					image_xscale = 1;
				}
			}
			//swap_direction_on_bump();
			move_x = move_speed * move_dir;
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case SLIMEENEMY_STATE.ATTACK:
		if (inner_state == 0) {
			start_animation(seq_spearslime_attack);
			inner_state = 1;
		} else if (inner_state == 1) {
			move_x = 0;
			check_animation(is_hit);
			if (enabled) {
				attack_cooldown = 30;
				change_state(SLIMEENEMY_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case SLIMEENEMY_STATE.HIT:
		if (inner_state == 0) {
			sprite_index = spr_spearslime_hit;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
		} else {
			no_hurt_frames = 30;
			is_hit = false;
			state = next_state;
			inner_state = 0;
		}
		break;
		
	case SLIMEENEMY_STATE.DEATH:
		if (inner_state == 0) {
			sprite_index = spr_spearslime_death;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
		}
		break;
}

