draw_self();

if (sprite_index == spr_player_move) {
	fps_factor = 2;
	curr_ani_frame_count = 10;
	curr_frame_pos = move_frame_pos;
} else {
	fps_factor = 6;
	curr_ani_frame_count = 7;
	curr_frame_pos = idle_frame_pos;
}

if curr_ani != sprite_index {
	frame_count = 0;
	step_counter = 0;
	curr_ani = sprite_index;
}

draw_sprite(spr_pig, -1, x - (sprite_width/2) + curr_frame_pos[frame_count][0], y - sprite_height + curr_frame_pos[frame_count][1]);
//draw_sprite_ext()

if step_counter == 0 {
	frame_count = (frame_count + 1) % curr_ani_frame_count;
}

step_counter = (step_counter + 1) % fps_factor;