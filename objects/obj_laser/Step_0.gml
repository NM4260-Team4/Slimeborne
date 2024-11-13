
x+=lengthdir_x(speed_x,image_angle); 
y+=lengthdir_y(speed_x,image_angle);

if (place_meeting(x, y, all_collidables)) {
	instance_destroy();
}
