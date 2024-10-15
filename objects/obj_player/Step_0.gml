// y movement
move_y += grav;

// keyboard controls
get_controls();
move_dir = right_key - left_key;
move_x = move_dir * move_speed;
if (move_dir != 0) {
	image_xscale = sign(move_dir);
}

// state machine
switch state {
	case PLAYER_STATE.IDLE:
		// init
		if (inner_state == 0) {
			inner_state = 1;
			sprite_index = spr_player_idle;
			image_speed = 1;
		} 
		// update
		else if (inner_state == 1) {
			if (jump_buffered && coyote_buffer_timer > 0) {
				change_state(PLAYER_STATE.JUMP);
			} else if (attack_buffered) {
				change_state(PLAYER_STATE.ATTACK);
			} else if (move_dir != 0) {
				change_state(PLAYER_STATE.MOVE);
			}
		} 
		// exit
		else {
			state = next_state;
			inner_state = 0;
		}
		
		break;
	
	case PLAYER_STATE.MOVE:
		// init
		if (inner_state == 0) {
			inner_state = 1;
			sprite_index = spr_player_move;
			image_speed = 1;
		}
		// update 
		else if (inner_state == 1) {
			if (jump_buffered && coyote_buffer_timer > 0) {
				change_state(PLAYER_STATE.JUMP);
			} else if (attack_buffered) {
				change_state(PLAYER_STATE.ATTACK);
			} else if (move_dir == 0) {
				change_state(PLAYER_STATE.IDLE);
			}
		} 
		// exit
		else {
			state = next_state;
			inner_state = 0;
		}
			
		break;
	
	case PLAYER_STATE.JUMP:
		// init
		if (inner_state == 0) {
			inner_state = 1;
			sprite_index = spr_player_jump;
			image_speed = 1;
			
			// reset the buffer
			jump_buffered = false;
			jump_buffer_timer = 0;
			// jump with jump_speed
			move_y = jump_speed;
			grounded = false;
		}
		// update
		else if (inner_state == 1) {
			if (move_y > 0) {
				change_state(PLAYER_STATE.FALL);
			}
		}
		// exit
		else {
			state = next_state;
			inner_state = 0;
		}
		
		break;
		
	case PLAYER_STATE.FALL:
		// init
		if (inner_state == 0) {
			inner_state = 1;
			sprite_index = spr_player_fall;
			image_speed = 0;
			image_index = 0;
		}
		// update
		else if (inner_state == 1) {
			if jump_buffered && coyote_buffer_timer > 0 {
				change_state(PLAYER_STATE.JUMP);
			} else if (grounded) {
				image_speed = 1;
				exit;
			}
		}
		// exit
		else {
			state = next_state;
			inner_state = 0;
		}
		
		break;
		
	case PLAYER_STATE.ATTACK:
		// init
		if (inner_state == 0) {
			inner_state = 1;
			// reset the buffer
			attack_buffered = false;
			attack_buffer_timer = 0;
			start_animation(seq_player_attack);
		}
		// update
		else if (inner_state == 1) {
			check_animation();
			if (!enabled) {
				exit;
			} else {
				change_state(PLAYER_STATE.IDLE);
			}
		}
		// exit
		else {
			state = next_state;
			inner_state = 0;
		}
		
		break;
		
	case PLAYER_STATE.HIT:
		// init
		if (inner_state == 0) {
			inner_state = 1;
			can_hit = false;
			sprite_index = spr_player_on_hit;
			image_speed = 1;
		}
		// update
		else if (inner_state == 1) {
			// does nothing, see animation end event
		}
		// exit
		else {
			can_hit = true;
			state = next_state;
			inner_state = 0;
		}
		
		break;
}

// move with x collision
var _sub_pixel = 0.5;
if place_meeting( x + move_x, y, all_collidables) {
	var _pixel_check = _sub_pixel * sign(move_x);
	while !place_meeting(x + _pixel_check, y, all_collidables) {
		x += _pixel_check;
	}
	move_x = 0;
}

x += move_x;

// move with y collision
if place_meeting( x, y + move_y, all_collidables) {
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
