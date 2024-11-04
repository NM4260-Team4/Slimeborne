if (is_hit or no_hurt_frames > 0 or other.state == ENEMY_STATE.DEATH) {
	exit; 
} else {
	hp -= 1;
	is_hit = true;
}
