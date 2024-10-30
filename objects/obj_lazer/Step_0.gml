
x+=lengthdir_x(speed_x,image_angle); 
y+=lengthdir_y(speed_x,image_angle);

if (position_meeting(x,y, all_collidables)) {
	instance_destroy();
}