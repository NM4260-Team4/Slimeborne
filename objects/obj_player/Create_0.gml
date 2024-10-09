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

// player's data
max_hp = global.player_state.max_hp;
hp = global.player_state.hp;
microplastics = global.player_state.microplastics;

// invincible frames
no_hurt_frames = 0;

// for collision
tile_1 = layer_tilemap_get_id("Tiles_1");
all_collidables = [tile_1, obj_collidable];

// Sprite values
fps_factor = 1; // Determining how much to slow the fps of the attachment 
frame_count = 0; // Current frame to draw
step_counter = 0; // Counts the steps to ensure that the fps is correct

curr_ani = spr_player_idle;
curr_ani_frame_count = 0; // Amount of frames for the current animation
curr_frame_pos = 0; // The current set of positions to draw the attachment
idle_frame_pos = [[32, 87], [32, 96], [33, 103], [33, 107], [34, 102], [32, 96], [32,88]];
move_frame_pos = [[32, 97], [35, 92], [34, 97], [29, 93], [27, 90], [28, 88], [24,92], [27, 88], [34, 87], [32, 81]];