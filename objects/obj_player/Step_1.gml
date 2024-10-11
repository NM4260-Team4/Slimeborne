// check and save if player is on the ground

grounded = place_meeting( x, y + 1, all_collidables);

if (grounded) {
	grounded_x = x;
	grounded_y = y;
}