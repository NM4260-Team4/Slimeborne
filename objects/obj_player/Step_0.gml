// y movement
move_y += grav;

// y collision
var _sub_pixel = 1;
if place_meeting( x, y + move_y, all_collidables) {
	var _pixel_check = _sub_pixel * sign(move_y);
	while !place_meeting(x, y + _pixel_check, all_collidables) {
		y += _pixel_check;
	}
	move_y = 0;
}

y += move_y;

// Reduce health if touching enemy
var _collision_box = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_base_enemy, false, true);
if _collision_box != noone and no_hurt_frames <= 0 and not is_attacking {
	hp -= 1;
	no_hurt_frames = 60; 
}

// invincible frame
if (no_hurt_frames > 0) {
	no_hurt_frames --;
}

// attack
if mouse_check_button_pressed(mb_left) and (grounded) {
	if (sprite_index != spr_player_attack) {
		is_attacking = true;
		image_index = 0;
		sprite_index = spr_player_attack;
	}
}
