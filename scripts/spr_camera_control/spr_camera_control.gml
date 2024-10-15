function center_camera() {
	cam_width = camera_get_view_width(view_camera[0]);
	cam_height = camera_get_view_height(view_camera[0]);

	cam_x = x - cam_width / 2;
	cam_y = y - cam_height / 2;

	cam_x = clamp(cam_x, 0, room_width - cam_width);
	cam_y = clamp(cam_y, 0, room_height - cam_height);

	camera_set_view_pos(view_camera[0], cam_x, cam_y);
}
