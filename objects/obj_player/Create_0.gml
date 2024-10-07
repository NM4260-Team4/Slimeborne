// moving
move_dir = 0;
move_speed = 6;
move_x = 0;
move_y = 0;

// jumping
grav = 1;
term_velocity = 10;
jump_speed = -22 // in GM, going up is negative y-axis

// to put player back when it falls into trap
grounded = false;
grounded_x = x;
grounded_y = y;

// player's health
hp = global.max_hp;

// invincible frames
no_hurt_frames = 0;

// for collision
tile_1 = layer_tilemap_get_id("Tiles_1");
all_collidables = [tile_1, obj_collidable];