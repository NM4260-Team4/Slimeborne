// Movement Properties
move_speed = 3;
move_dir = -1;
move_x = 0;
move_y = 0;
grav = 1;

// Other Properties
max_health = 2;
no_hurt_frames = 0;

// for collision
tile_1 = layer_tilemap_get_id("Tiles_1");
all_collidables = [tile_1, obj_collidable];