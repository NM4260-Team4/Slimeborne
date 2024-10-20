health = 10;

// moving
move_dir = -1;
move_speed = 5;
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
	ATTACK,
	BREAK,
	DEATH
}

state = BOSS_STATE.TARGETING;
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