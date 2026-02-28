cam_x = camera_get_view_x(view_camera[0]);
layer_id = layer_get_id("Background");

parallax = 0.3;

layer_x(layer_id, -cam_x * parallax);