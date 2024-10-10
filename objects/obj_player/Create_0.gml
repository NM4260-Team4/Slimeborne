set_up_controls();

// moving
move_dir = 0;
move_speed = 10;
move_x = 0;
move_y = 0;

// jumping
grav = 1;
term_velocity = 10;
jump_speed = -24 // in GM, going up is negative y-axis

// to put player back when it falls into trap
grounded = false;
grounded_x = x;
grounded_y = y;

// player state
is_attacking = false;
is_hit = false;

// player's data
max_hp = global.player_state.max_hp;
hp = global.player_state.hp;
microplastics = global.player_state.microplastics;

// invincible frames
no_hurt_frames = 0;

// for collision
tile_1 = layer_tilemap_get_id("Tiles_1");
all_collidables = [tile_1, obj_collidable];

// Attachment sprite values
has_attachment = false;
attachment = NaN;
curr_frame_pos = 0; // The current set of positions to draw the attachment
idle_frame_pos = [[32, 87], [32, 96], [33, 103], [33, 107], [34, 102], [32, 96], [32,88]];
move_frame_pos = [[32, 97], [35, 92], [34, 97], [29, 93], [27, 90], [28, 88], [24,92], [27, 88], [34, 87], [32, 81]];
attack_frame_pos = [[28, 89], [34, 106], [28, 124], [54, -6], [283, 174]];

// Function for adding attachment
function add_attachment(_obj_attachment) {
	has_attachment = true;
	attachment = _obj_attachment;
}