if (!instance_exists(obj_player)) {
	instance_destroy();
	exit;
}

speed_x = 7;
if instance_exists(obj_player) {
	target_x = (obj_player.bbox_right + obj_player.bbox_left) / 2;
	target_y = (obj_player.bbox_top + obj_player.bbox_bottom) / 2;
} else {
	target_x = 0;
	target_y = 0;
}


alarm[0] = 180;
image_angle = point_direction(x, y, target_x, target_y);


collision_tiles = layer_tilemap_get_id("Collision_tiles");
all_collidables = [collision_tiles, obj_collidable, obj_breakable_wall, obj_final_door];
