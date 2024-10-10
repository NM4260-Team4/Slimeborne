function set_up_controls() {
	buffer_time = 10;
	jump_buffered = 0;
	jump_buffer_timer = 0;
}

function get_controls() {
	// keyboard inputs
	right_key = keyboard_check(ord("D"));
	left_key = keyboard_check(ord("A"));
	jump_pressed = keyboard_check_pressed(vk_space);
	
	// jump key buffering
	if (jump_pressed) {
		jump_buffer_timer = buffer_time;
	}
	if (jump_buffer_timer > 0) {
		jump_buffered = 1;
		jump_buffer_timer--;
	} else {
		jump_buffered = 0;
	}
}