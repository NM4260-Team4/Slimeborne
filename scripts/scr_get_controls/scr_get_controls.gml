function set_up_buffer() {
	buffer_frames = 8;
	jump_buffered = false;
	jump_buffer_timer = 0;
	
	// coyote time
	coyote_buffer_frames = 6;
	coyote_buffer_timer = 0;

}

function get_controls() {
	// keyboard inputs
	right_key = keyboard_check(ord("D"));
	left_key = keyboard_check(ord("A"));
	jump_pressed = keyboard_check_pressed(vk_space);
	
	// jump key buffering
	if (jump_pressed) {
		jump_buffer_timer = buffer_frames;
	}
	if (jump_buffer_timer > 0) {
		jump_buffered = 1;
		jump_buffer_timer--;
	} else {
		jump_buffered = 0;
	}
	
	// set coyote time
	if grounded {
		coyote_buffer_timer = coyote_buffer_frames;
	} else {
		coyote_buffer_timer--;
	}
}