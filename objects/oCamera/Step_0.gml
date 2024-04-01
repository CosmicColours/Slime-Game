/// @description Insert description here
// You can write your code in this editor

if (instance_exists(follow)) {

	x_to = follow.x;
	
	y_to = follow.y;

}

x += (x_to - x) / 25;

y += (y_to - y) / 25;


x = clamp(x, view_w_half, room_width - view_w_half);

y = clamp(y, view_h_half, room_height - view_h_half);



camera_set_view_pos(cam, x - view_w_half, y - (view_h_half * 1.2));