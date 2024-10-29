event_inherited();

enum PIPE_STATE {
	NORMAL,
	HEATING,
	OVERCHARGED
}

state = PIPE_STATE.NORMAL;
duration_to_normal = 101;

function hit() {
	if (state == PIPE_STATE.NORMAL) {
		state = PIPE_STATE.HEATING;
	} else if (state == PIPE_STATE.HEATING) {
		state = PIPE_STATE.OVERCHARGED;
		alarm[0] = duration_to_normal;
	}
}
