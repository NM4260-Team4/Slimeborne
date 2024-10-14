check_animation();
if (!enabled) exit;
get_controls();

// x movement
move_dir = right_key - left_key;
move_x = move_dir * move_speed;

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

// y movement
move_y += grav;

// set coyote time
if grounded {
	coyote_buffer_timer = coyote_buffer_frames;
} else {
	coyote_buffer_timer--;
}

// jump
if jump_buffered && coyote_buffer_timer > 0 {
	// reset the buffer
	jump_buffered = false;
	jump_buffer_timer = 0;
	// jump with jump_speed
	move_y = jump_speed;
	grounded = false;
}

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

// attack
if mouse_check_button_pressed(mb_left) and (grounded) {
	start_animation(seq_player_attack)
}
