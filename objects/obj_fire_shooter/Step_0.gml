if (damage_buffer > 0) {
	damage_buffer --;
}

if (timer >= safe_duration + warn_duration + danger_duration) {
	timer = 0;
} else {
	timer ++;
}

if (timer < safe_duration) {
	state = ITEM_STATE.SAFE;
} else if (timer < safe_duration + warn_duration) {
	state = ITEM_STATE.WARN;
} else {
	state = ITEM_STATE.DANGER;
}

switch state {
	case ITEM_STATE.SAFE:
		image_index = 0;
		break;
	case ITEM_STATE.WARN:
		image_index = 1;
		break;
	case ITEM_STATE.DANGER:
		image_index = 2;
		break;
}

if (state != ITEM_STATE.DANGER) {exit;}

if (!instance_exists(obj_player)) {exit;}

if (place_meeting(x, y, obj_player)) {
	
	if (damage_buffer > 0) {exit;}

	with (obj_player) {
		hp --;
		other.damage_buffer = 60;

		if (hp > 0) {
			is_hit = true;
			move_x = 0;
			move_y = 0;
			
		} else {
			exit;
		}
	}
	
}
