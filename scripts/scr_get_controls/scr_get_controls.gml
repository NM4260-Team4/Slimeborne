function set_up_buffer() {
	buffer_frames = 4;
	jump_buffered = false;
	jump_buffer_timer = 0;
	
	attack_buffered = false;
	attack_buffer_timer = 0;
	
	// coyote time
	coyote_buffer_frames = 6;
	coyote_buffer_timer = 0;

}

function get_controls() {
	// keyboard inputs
	right_key = keyboard_check(ord("D"));
	left_key = keyboard_check(ord("A"));
	jump_pressed = keyboard_check_pressed(vk_space);
	attack_pressed = mouse_check_button_pressed(mb_left);
	if (mouse_check_button_pressed(mb_right)) {
		is_hit = true;
		//show_debug_message("right meeting: " + string(place_meeting(x + 1, y, all_collidables)));
		//show_debug_message("down meeting: " + string(place_meeting(x, y + 1, all_collidables)));
	}
	
	// jump key buffering
	if (jump_pressed) {
		jump_buffer_timer = buffer_frames;
	}
	if (jump_buffer_timer > 0) {
		jump_buffered = true;
		jump_buffer_timer--;
	} else {
		jump_buffered = false;
	}
	
	// attack key buffering
	if (attack_pressed) {
		attack_buffer_timer = buffer_frames;
	}
	if (attack_buffer_timer > 0) {
		attack_buffered = true;
		attack_buffer_timer--;
	} else {
		attack_buffered = false;
	}
	
	// set coyote time
	if grounded {
		coyote_buffer_timer = coyote_buffer_frames;
	} else {
		coyote_buffer_timer--;
	}
}