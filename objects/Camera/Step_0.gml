following = oBloke; 

if (instance_exists(following)) {
	if (!variable_instance_exists(id, "cam")) {
		cam = view_camera[0];
	}
	
	if (cam != -1) {
		camW = camera_get_view_width(cam);
		camH = camera_get_view_height(cam);
	
		xTo = following.x - camW/2;
		yTo = following.y - camH/2;
	
		camera_set_view_pos(cam, xTo, yTo);
	}
}
