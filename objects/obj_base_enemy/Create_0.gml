// Movement Properties
move_speed = 3;
move_dir = -1;
move_x = 0;
move_y = 0;
grav = 1;

// Other Properties
max_health = 2;
no_hurt_frames = 0;
is_dead = false;

// for collision
collision_tiles = layer_tilemap_get_id("Collision_tiles");
all_collidables = [collision_tiles, obj_collidable, obj_breakable_wall];