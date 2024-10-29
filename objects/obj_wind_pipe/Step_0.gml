event_inherited();

switch state {
	case PIPE_STATE.NORMAL:
		sprite_index = spr_wind_pipe_normal;
		break;
	case PIPE_STATE.HEATING:
		sprite_index = spr_wind_pipe_heating;
		break;
	case PIPE_STATE.OVERCHARGED:
		sprite_index = spr_wind_pipe_overcharged;
		break;
}
