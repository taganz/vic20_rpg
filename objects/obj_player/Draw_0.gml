/// @description  pinta sprite i sombra


player_draw_sprite();


// text que surt a sobre en estat debug

if (global.debug) {
	draw_set_font(fTextDebug)
	draw_set_color(c_black);
	draw_text(x, y-96, 
			"x,y: "+string(x) + "," +string(y)
			+"Estat:"+string(state)+"-"+state_to_string_player(state)
			//+", x/y_frame: "+string(floor(x_frame))+", "+string(floor(y_frame))
			+"\nhp:"+string(global.player_health_max)
			+ "\nDir: "+string(direction)
			+ "  h,vSpeed: "+string(hSpeed)+", "+string(vSpeed)
			//+"\nbbox: "+string(bbox_left) + "," +string(bbox_top)+","+string(bbox_right) + "," +string(bbox_bottom)
			);
	// rectangle activacio en player_state_activate
	var _activateX = x + lengthdir_x(20, direction);
	var _activateY = y - OFFSET_Y_ACTIVACIO +  lengthdir_y(20, direction);
	var _activateSize = 4 
	draw_rectangle(
			_activateX-_activateSize,
			_activateY-_activateSize*2,
			_activateX+_activateSize,
			_activateY+_activateSize*2,
			true);


}


			
			