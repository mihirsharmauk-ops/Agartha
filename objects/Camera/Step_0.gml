following = oBloke; 

if (instance_exists(following)) {
	camW = camera_get_view_width(cam);
	camH = camera_get_view_height(cam)
	
	xTo = following.x - camW/2;
	yTo = following.y - camH/2;
	
	camera_set_view_pos(cam, xTo, yTo);
}