/// @desc Update to player's new position


following = obj_player;

x = obj_player.x;
y = obj_player.y;


if string_copy(room_get_name(room), 1, 9)=="rm_desert"
	|| string_copy(room_get_name(room), 1, 11) == "rm_muntanya"
	|| room_get_name(room) == "rm_preso_sigilo" 
	|| room_get_name(room) == "rm_preso_aranyes" 
	|| room_get_name(room) == "rm_debug"
	{
    view_visible[0] = true;
    view_enabled = true;
	view_set_wport(0, 1500);
	view_set_hport(0, 820);
	camera_set_view_target(view_camera[0], obj_player);
    camera_set_view_border(view_camera[0], 375, 420);
	camera_set_view_size(view_camera[0], 750, 420);
}

