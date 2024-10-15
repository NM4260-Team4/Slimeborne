draw_self();

if (sprite_index == spr_player_move) {
	curr_frame_pos = move_frame_pos;
	curr_rot = move_rot;
} else if (sprite_index == spr_player_idle) {
	curr_frame_pos = idle_frame_pos;
	curr_rot = idle_rot;
} else if (sprite_index == spr_player_jump) {
	curr_frame_pos = jump_frame_pos;
	curr_rot = jump_rot;
} else if (sprite_index == spr_player_fall) {
	curr_frame_pos = fall_frame_pos;
	curr_rot = fall_rot;
} else if (sprite_index == spr_player_on_hit) {
	curr_frame_pos = hit_frame_pos;
	curr_rot = hit_rot;
} 

if has_attachment {
	//draw_sprite(attachment.sprite_index, 0, x - sprite_get_xoffset(sprite_index) * image_xscale + curr_frame_pos[image_index][0], y - sprite_get_yoffset(sprite_index) + curr_frame_pos[image_index][1]);
	draw_sprite_ext(attachment.sprite_index, 0,x - (sprite_get_xoffset(sprite_index)  - curr_frame_pos[image_index][0])* image_xscale , y - sprite_get_yoffset(sprite_index) + curr_frame_pos[image_index][1], 1, 1, curr_rot[image_index] * image_xscale, -1, 1);
}


