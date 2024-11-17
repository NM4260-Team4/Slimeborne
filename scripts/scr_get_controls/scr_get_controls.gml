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
	attack_pressed = clamp(mouse_check_button_pressed(mb_left) + keyboard_check(ord("J")), 0, 1);
	swap_pressed = keyboard_check_pressed(ord("Q"));
	swap_potion_pressed = keyboard_check_pressed(ord("R"));
	use_potion_pressed = keyboard_check_pressed(ord("F"));
	
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