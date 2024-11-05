 set_up_buffer();

// set default spawn point in the level if there is no save file
if (global.player_state.respawn_x == -1) {
	global.player_state.respawn_x = x;
} else {
	x = global.player_state.respawn_x;
}
if (global.player_state.respawn_y == -1) {
	global.player_state.respawn_y = y;
} else {
	y = global.player_state.respawn_y;
}

// Potion 
effect_timer = 0;

// moving
move_dir = 0;
move_speed = 10;
move_x = 0;
move_y = 0;

// jumping
grav = 1;
term_velocity = 10;
auto_jump = false;
jump_speed = -24 // in GM, going up is negative y-axis

// to put player back when it falls into trap
grounded = false;
grounded_x = x;
grounded_y = y;

// player state
should_freeze = false;
is_hit = false;
just_paused = false;
enum PLAYER_STATE {
	IDLE,
	MOVE,
	JUMP,
	FALL,
	ATTACK,
	HIT,
	DEATH
}
state = PLAYER_STATE.IDLE;
next_state = state;
inner_state = 0;
change_state = function(_next_state) {
	inner_state = 2;
	next_state = _next_state;
}

// player's data
max_hp = global.player_state.max_hp;
hp = global.player_state.hp;
microplastics = global.player_state.microplastics;

// invincible frames
no_hurt_frames = 0;

// for collision
collision_tiles = layer_tilemap_get_id("Collision_tiles");
all_collidables = [collision_tiles, obj_collidable, obj_breakable_wall, obj_final_door];

// Attachment sprite values
curr_frame_pos = 0; // The current set of positions to draw the attachment

idle_frame_pos = [[32, 87], [32, 96], [33, 103], [33, 107], [34, 102], [32, 96], [32,88]];
move_frame_pos = [[32, 97], [35, 92], [34, 97], [29, 93], [27, 90], [28, 88], [24,92], [27, 88], [34, 87], [32, 81]];
jump_frame_pos = [[31, 77], [32, 76], [36, 94], [45, 114]]
fall_frame_pos = [[14, 71], [14, 50], [20, 45], [30, 22], [25, 26], [24,31], [23, 35]]
hit_frame_pos = [[31, 89], [25, 109], [36, 94], [17, 71]]

curr_rot = 0;
idle_rot = [92, 95, 100, 102, 100, 95, 92]
move_rot = [100, 95, 100, 97, 97, 96, 99, 97, 97, 92]
jump_rot = [91, 90, 115, 135]
fall_rot = [108, 93, 86, 60, 65, 74, 87] 
hit_rot = [92, 70,80]

// Function for adding attachment

show_swap_prompt = false; // Whether or not the prompt SHOULD be shown
// For Sequencing
enabled = true;
not_attacking = true
enable = function () {
	enabled = true;
	image_alpha = 1;
	if (global.equipped.has_attachment) {
		not_attacking = true;
	}
}

disable = function () {
	enabled = false;
	image_alpha = 0;
	if (global.equipped.has_attachment) {
		not_attacking = false;
	}
	move_x = 0;
}

// Sequence animation checks and playing
active_animation = -1;
active_sequence = -1;
function start_animation(_sequence) {
	active_animation = _sequence;
	active_sequence = layer_sequence_create(layer, x, y, _sequence);
	layer_sequence_xscale(active_sequence, image_xscale);
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