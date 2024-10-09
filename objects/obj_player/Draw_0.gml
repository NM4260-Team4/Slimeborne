draw_self();

if (sprite_index == spr_player_move) {
	curr_frame_pos = move_frame_pos;
} else if (sprite_index == spr_player_idle) {
	curr_frame_pos = idle_frame_pos;
} else if (sprite_index == spr_player_attack) {
	curr_frame_pos = attack_frame_pos;
}

if has_attachment {
	draw_sprite(attachment.sprite_index, 0, x - 96 * move_dir + curr_frame_pos[image_index][0], y - 192 + curr_frame_pos[image_index][1]);
	//draw_sprite_ext(spr_pig, 0, x - 96 + curr_frame_pos[image_index][0], y - 192 + curr_frame_pos[image_index][1], 1, 1)
}


