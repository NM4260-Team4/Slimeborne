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

if (!instance_exists(obj_player)) {
	exit;
}

// State handling
switch state {
	case SLIMEENEMY_STATE.ROAM:
		if (inner_state == 0) {
			sprite_index = spr_boomslime_move;
			inner_state = 1
			move_speed = 2;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp <= 0) {
					change_state(SLIMEENEMY_STATE.DEATH);
					break;
				}
				change_state(SLIMEENEMY_STATE.HIT);
				break;
			}
			
			if (abs(x - obj_player.x) < 600 and abs(y - obj_player.y) < 50 and sees_player()) {
				change_state(SLIMEENEMY_STATE.TARGETING);
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
	case SLIMEENEMY_STATE.TARGETING:
		if (inner_state == 0) {
			sprite_index = spr_boomslime_move;
			inner_state = 1;
			move_speed = 6;
		} else if (inner_state == 1) {
			if (is_hit) {
				if (hp <= 0) {
					change_state(SLIMEENEMY_STATE.DEATH);
					break;
				}
				change_state(SLIMEENEMY_STATE.HIT);
				break;
			}
			if (abs(x - obj_player.x) >= 600 or abs(y - obj_player.y) > 50 or not sees_player()) {
				change_state(SLIMEENEMY_STATE.ROAM);
				break;
			}

			if (x > obj_player.x) {
				move_dir = -1;
				image_xscale = -1 * abs(image_xscale);
			} else {
				move_dir = 1;
				image_xscale = abs(image_xscale);
			}
			
			if (abs(x - obj_player.x) < 100) {
				if (attack_cooldown == 0) {
					attack_cooldown = irandom_range(5, 30);
					change_state(SLIMEENEMY_STATE.ATTACK);
				} else {
					move_speed = 0;
					sprite_index = spr_boomslime_idle;
				}
				break;
			} else {
				move_speed = 6;
				sprite_index = spr_boomslime_move;
			}
			//swap_direction_on_bump();
			var _no_floor = (not position_meeting(bbox_right, bbox_bottom + 1, all_collidables[0]) and move_dir > 0) or (not position_meeting(bbox_left, bbox_bottom + 1, all_collidables[0]) and move_dir < 0);
			var _has_wall = (position_meeting(bbox_right + 2, bbox_top, all_collidables) and move_dir > 0) or (position_meeting(bbox_left - 2, bbox_top, all_collidables) and move_dir < 0);
			if _no_floor or _has_wall {
				move_speed = 0;
			}
			move_x = move_speed * move_dir;
			x += move_x;
		} else {
			state = next_state;
			inner_state = 0;
		}
		break;
	case SLIMEENEMY_STATE.ATTACK:
		if (inner_state == 0) {
			if (attack_cooldown == 0) {
				audio_play_sound(snd_boomslime_attack, 10, false);
				start_animation(seq_boomslime_attack);
				inner_state = 1;
			}
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
			sprite_index = spr_boomslime_hit;
			inner_state = 1;
			move_speed = 0;
			image_index = 0;
			audio_play_sound(snd_metalslime_hit, 10, false);
		} else if (inner_state == 1) {
			move_x = 0;
		} else {
			//no_hurt_frames = 5;
			is_hit = false;
			state = next_state;
			inner_state = 0;
		}
		break;
		
	case SLIMEENEMY_STATE.DEATH:
		if (inner_state == 0) {
			start_animation(seq_boomslime_death);
			inner_state = 1;
			image_index = 0;
			move_speed = 0;
			audio_play_sound(snd_boomslime_death, 10, false);
		} else if (inner_state == 1) {
			check_animation(false);
			if (enabled) {
				instance_destroy();
				obj_currency.add_microplastics(10);
			}
		}
		break;
}

