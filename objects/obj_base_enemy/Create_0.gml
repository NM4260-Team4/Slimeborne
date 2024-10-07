event_inherited();
// Gravity
grav = 1;
move_x = 0;
move_y = 0;

// for collision
tile_1 = layer_tilemap_get_id("Tiles_1");
all_collidables = [tile_1, obj_collidable];

// Base health of enemy, to be overriden by subclasses
hp = 2;

// Override interact(), change it to decreasing health
function hit() {
	hp -= 1;
}