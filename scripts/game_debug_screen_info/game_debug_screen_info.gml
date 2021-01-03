/// @desc camera, view, etc variables
function game_debug_screen_info(){
	// tamany fisic pantalla
	show_debug_message("DISPOSITIU");
	show_debug_message("*** display_get_width():" + string(display_get_width()));
	show_debug_message("*** display_get_height():" + string(display_get_height()));
	// tamany viewport
	show_debug_message("VIEWPORT 0 - TAMANY");
	show_debug_message("*** view_wport[0]:" + string(view_wport[0]));
	show_debug_message("*** view_hport[0]:" + string(view_hport[0]));
	// posicio viewport
	show_debug_message("VIEWPORT 0 - POSICIO");
	show_debug_message("*** view_get_xport(0):" + string(view_get_xport(0)));
	show_debug_message("*** view_get_yport(0):" + string(view_get_yport(0)));
	// camara
	var _cam = view_camera[0];
	show_debug_message("CAMARA VIEWPORT 0");
	show_debug_message("*** camera_get_view_width(_cam):" + string(camera_get_view_width(_cam)));
	show_debug_message("*** camera_get_view_height(_cam):" + string(camera_get_view_height(_cam)));
	show_debug_message("CAMARA BORDER ");
	show_debug_message("*** camera_get_view_border_x/y(_cam):"
			+ string(camera_get_view_border_x(_cam))
			+ " x " +string(camera_get_view_border_y(_cam))
			);
			
	// tamany habitacio
	show_debug_message("ROOM");
	show_debug_message("*** room_name:" + room_get_name(room) );
	show_debug_message("*** room_width / room_height:" + string(room_width)+" x "+string(room_height));

}