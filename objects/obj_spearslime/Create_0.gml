hp = 4;
max_hp = 4;

// Frame counts
attack_cooldown = 0;
break_frames = 0;
no_hurt_frames = 0;

// moving
move_dir = 1;
move_speed = 1;
move_x = 0;
move_y = 0;

// jumping
grav = 1;

// for collision
collision_tiles = layer_tilemap_get_id("Collision_tiles");
all_collidables = [collision_tiles, obj_collidable, obj_breakable_wall];

// boss state
is_hit = false;
enum SLIMEENEMY_STATE {
	ROAM,
	TARGETING,
	ATTACK,
	HIT,
	DEATH
}

state = ENEMY_STATE.ROAM;
next_state = state;
inner_state = 0;
change_state = function(_next_state) {
	inner_state = 2;
	next_state = _next_state;
}

function sees_player() {
	return collision_line(x, (bbox_top + bbox_bottom) / 2, obj_player.x,  (obj_player.bbox_top + obj_player.bbox_bottom) / 2, all_collidables, 1, 0) == noone;
}

function swap_direction_on_bump() {
	var _right_has_block = not position_meeting(bbox_right, bbox_bottom + 1, all_collidables[0]) or position_meeting(bbox_right + 2, bbox_bottom - 1, all_collidables);
	var _left_has_block =  not position_meeting(bbox_left, bbox_bottom + 1, all_collidables[0]) or position_meeting(bbox_left - 2, bbox_bottom - 1, all_collidables);
	if _right_has_block{
		move_dir = -1;
		image_xscale = -1 * abs(image_xscale);
	} else if _left_has_block {
		move_dir = 1;
		image_xscale = abs(image_xscale);
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

weak_sequence = -1;
weakness = obj_hammer_attach;	