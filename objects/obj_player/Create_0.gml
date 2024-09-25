// moving
move_dir = 0;
move_speed = 6;
x_speed = 0;
y_speed = 0;

// jumping
grav = 1;
term_velocity = 10;
jump_speed = -20 // in GM, going up is negative y-axis

// to put player back when it falls into trap
grounded = false;
grounded_x = x;
grounded_y = y;

// player's health
max_hp = 5;
hp = max_hp;

// invincible frames
no_hurt_frames = 0;
