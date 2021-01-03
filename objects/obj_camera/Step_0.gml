/// @description


/*  <--- ANTIC PER PODER MOURE LA CAMERA. BORRAR?
read_user_input();

if (input_camera_move) {
	x += (input_camera_right - input_camera_left) * 6;	
	y += (input_camera_down - input_camera_up) * 6;
} else {
	x = clamp(x, following.x - h_border, following.x + h_border);
	y = clamp(y, following.y - v_border, following.y + v_border);
}
*/

//Update destination
if (instance_exists(following))
{
	xTo = following.x;	
	yTo = following.y;
}

//Update Object Position
//x += (xTo - x) / 15;
//y += (yTo - y) / 15;
x = clamp(x, xTo - h_border, xTo + h_border);
y = clamp(y, yTo - v_border, yTo + v_border);


//Keep camera center inside room
x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);

//Screenshake
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam,x - viewWidthHalf, y - viewHeightHalf);

