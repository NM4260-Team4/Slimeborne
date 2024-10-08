draw_self();

draw_sprite(spr_pig, -1, x - (sprite_width/2) + att_pos[spr_count][0], y - sprite_height +  + att_pos[spr_count][1]);
//draw_sprite_ext()
spr_slower = (spr_slower + 1) % 6;
if spr_slower == 0 {
	spr_count = (spr_count + 1) % 7;
}
