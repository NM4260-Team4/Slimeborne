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