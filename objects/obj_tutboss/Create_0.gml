health = 10;

// Frame counts
attack_cooldown = 0;
break_frames = 0;


// moving
move_dir = -1;
move_speed = 2;
move_x = 0;
move_y = 0;

// jumping
grav = 1;

// for collision
collision_tiles = layer_tilemap_get_id("Collision_tiles");
all_collidables = [collision_tiles, obj_collidable, obj_breakable_wall];

// boss state
is_hit = false;
enum BOSS_STATE {
	ROAM,
	TARGETING,
	BASE_ATTACK,
	SWEEP_ATTACK,
	BREAK,
	DEATH
}

state = BOSS_STATE.ROAM;
next_state = state;
inner_state = 0;
change_state = function(_next_state) {
	inner_state = 2;
	next_state = _next_state;
}

function swap_direction_on_bump() {
	if not position_meeting(x + move_dir * sprite_width/2, y + 1, all_collidables[0]) or position_meeting(x + move_dir * sprite_width/2, y - 1, all_collidables){
		move_dir = -1 * move_dir
	}
}

enabled = true;
enable = function () {
	enabled = true;
	image_alpha = 1;
}

disable = function () {
	enabled = false;
	alarm[0] = 1;
	image_alpha = 0;
	move_x = 0;
}

// Sequence animation checks and playing
active_animation = -1;
active_sequence = -1;
function start_animation(_sequence) {
	active_animation = _sequence;
	active_sequence = layer_sequence_create(layer, x, y, _sequence);
	layer_sequence_xscale(active_sequence, -1 * move_dir);
	disable();
}

function check_animation(_should_interrupt) {
	if (active_sequence == undefined) return;
	
	if (_should_interrupt or layer_sequence_is_finished(active_sequence)) {
		layer_sequence_destroy(active_sequence);
		
		active_animation = -1;
		active_sequence = -1;
		
		enable();
	}
}