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

// Counting timers
if (attack_cooldown > 0) {
	attack_cooldown--;
}

// State handling
switch state {
	case BOSS_STATE.ROAM:
		if (inner_state == 0) {
			sprite_index = spr_tutboss_idle;
			inner_state = 1
			move_speed = 2;
		} else if (inner_state == 1) {
			if (abs(x - obj_player.x) < 1000 and abs(y - obj_player.y) < 500) {
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
			sprite_index = spr_tutboss_idle;
			inner_state = 1;
			move_speed = 6.5;
		} else if (inner_state == 1) {
			if (abs(x - obj_player.x) < 400 and abs(x - obj_player.x) > 300 and attack_cooldown == 0) {
				change_state(BOSS_STATE.BASE_ATTACK);
				break;
			}
			if _on_land {
				if (x > obj_player.x + 350) {
					move_dir = -1;
					image_xscale = 1;
				} else if (x <= obj_player.x + 350 and x >= obj_player.x - 350){
					// Extra checks for direction and all that
					move_dir = 0;
					if (x > obj_player.x) {
						image_xscale = 1;
					} else {
						image_xscale = -1;
					}
					if (attack_cooldown == 0) {
						change_state(BOSS_STATE.SWEEP_ATTACK);
						break;
					}
				} else {
					move_dir = 1;
					image_xscale = -1;
				}
				move_x = move_speed * move_dir;
			} 
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
			check_animation(false);
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
			start_animation(seq_tutboss_sweep_attack);
			inner_state = 1;
		} else if (inner_state == 1) {
			check_animation(false);
			if (enabled) {
				attack_cooldown = 30;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	
}

