image_speed = 0;
image_index = 0;

enum ITEM_STATE {
	SAFE,
	WARN,
	DANGER
}

damage_buffer = 0;
state = ITEM_STATE.SAFE;
timer = delay;
safe_duration = 200;
warn_duration = 100;
danger_duration = 100;
