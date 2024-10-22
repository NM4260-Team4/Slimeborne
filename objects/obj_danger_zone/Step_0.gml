if (place_meeting(x, y, obj_player)) {
	
	if (!should_damage) {exit;}

	with (obj_player) {
		hp --;
		other.should_damage = false;

		if (hp > 0) {
			if (other.is_on_ground) {
				x = grounded_x;
				y = grounded_y;
				should_freeze = true;
				other.alarm[0] = 20;
			} else {
				is_hit = true;
			}
			move_x = 0;
			move_y = 0;
			
		} else {
			exit;
		}
	}
	
} else {
	should_damage = true;
}
