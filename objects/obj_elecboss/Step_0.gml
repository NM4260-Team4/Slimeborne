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

if not electric_floor_active {
	instance_deactivate_object(obj_electric);
}

if (!instance_exists(obj_player)) {
	exit;
}

// State handling
switch state {
	case BOSS_STATE.IDLE: 
		if (inner_state == 0) {
			sprite_index = spr_elecboss_idle;
			inner_state = 1
			move_speed = 0;
		} else if (inner_state == 1) {
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (point_distance(x, y, obj_player.x, obj_player.y) < 1200) {
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
			sprite_index = spr_elecboss_move;
			inner_state = 1
			move_speed = 2;
		} else if (inner_state == 1) {
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (is_stumbled) {
				change_state(BOSS_STATE.BREAK);
				break;
			}
			
			if (point_distance(x, y, obj_player.x, obj_player.y) < 3000) {
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
			// Set up for the next state
			sprite_index = spr_elecboss_move;
			inner_state = 1;
			move_speed = 3;
			move_dir = sign(image_xscale);
		} else if (inner_state == 1) {
			// When the boss is dead, swap states
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			// When the boss is broken, swap states
			if (is_stumbled) {
				change_state(BOSS_STATE.BREAK);
				break;
			}
			
			// If player too far/ too close, move towards player and attack if no cooldown
			if (abs(x - obj_player.x) > 920 or abs(x - obj_player.x) < 350) {
				if attack_cooldown == 0 {
					change_state(BOSS_STATE.ATTACK1);
					break;
				}
			}
			
			if (abs(x - obj_player.x) <= 920 and abs(x - obj_player.x) >= 350) {
				if attack_cooldown == 0 {
					change_state(BOSS_STATE.ATTACK2);
					break;
				}
			}
			
			
			// Regular movement
			
			if (x - obj_player.x) > 900 or (obj_player.x - x >= 0 and obj_player.x - x < 400) or (x-obj_player.x >= 420 and x- obj_player.x < 910){
				// If to the right of the player or to the left of the player but very close, move to the left
				move_dir = -1;
				image_xscale = -1 * abs(image_xscale);
			} else if (obj_player.x - x) > 900 or (x - obj_player.x >= 0 and x - obj_player.x < 400) or (obj_player.x - x >= 420 and obj_player.x - x < 910){
				// If to the right of the player or to the left of the player but very close, move to the left
				move_dir = 1;
				image_xscale =abs(image_xscale);
			} else {
				move_dir = 0;
				if (x < obj_player.x) {
					image_xscale = abs(image_xscale);
				} else {
					image_xscale = -1 * abs(image_xscale);
				}
			}
			
			
			// Collision prevention
			var _right_has_block = not position_meeting(bbox_right, bbox_bottom + 1, all_collidables[0]) or position_meeting(bbox_right + 2, bbox_bottom - 1, all_collidables);
			var _left_has_block =  not position_meeting(bbox_left, bbox_bottom + 1, all_collidables[0]) or position_meeting(bbox_left - 2, bbox_bottom -1 , all_collidables);
			if _right_has_block or _left_has_block {
				move_dir = 0;
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
			start_animation(seq_elecboss_ground_attack);
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			check_animation(is_stumbled or hp <= 0);
			if (hp <= 0) {
				deactivate_electric_floor();
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (is_stumbled) {
				deactivate_electric_floor();
				change_state(BOSS_STATE.BREAK);
				break;
			}
			if (enabled) {
				deactivate_electric_floor();
				attack_cooldown = 60;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.ATTACK2:
		if (inner_state == 0) {
			start_animation(seq_elecboss_laser_attack);
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			check_animation(is_stumbled or hp <= 0);
			if (hp <= 0) {
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if (is_stumbled) {
				change_state(BOSS_STATE.BREAK);
				break;
			}
			if (enabled) {
				attack_cooldown = 60;
				change_state(BOSS_STATE.TARGETING);
			}
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case BOSS_STATE.BREAK:
		if (inner_state == 0) {
			sprite_index = spr_elecboss_break;
			image_index = 0;
			inner_state = 1;
			move_speed = 0;
			audio_stop_sound(snd_elecboss_groundpre);
			audio_stop_sound(snd_elecboss_laser_pr);
			audio_stop_sound(snd_elecboss_laser);
			audio_stop_sound(snd_electric_floor);
			audio_play_sound(snd_stumble, 10, false);
		} else if (inner_state == 1) {
			if (hp <= 0) {
				show_debug_message("asdf")
				change_state(BOSS_STATE.DEATH);
				break;
			}
			if image_index == 13.05 {
				audio_play_sound(snd_bigslime_return, 10, false);
			}
		} else if (inner_state == 2) {
			is_stumbled = false;
			state = next_state;
			inner_state = 0;
		} 
		break;
	case BOSS_STATE.DEATH:
		if (inner_state == 0) {
			image_index = 0;
			sprite_index = spr_elecboss_death;
			inner_state = 1;
			move_speed = 0;
		} else if (inner_state == 1) {
			move_x = 0;
			if image_index == 1 {
				audio_play_sound(snd_elecboss_death2, 10, false);
			}
			if image_index == 2 {
				audio_play_sound(snd_elecboss_death1, 10, false);
			}
		}
		break;
}

