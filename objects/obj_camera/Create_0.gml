/// @description Insert description here
// You can write your code in this editor
following = obj_player;


h_border = 60;
v_border = 30;


/// @desc Set up camera
cam = view_camera[0];



viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;



//camera_set_view_size(cam, view_wport[0], view_hport[0]);
