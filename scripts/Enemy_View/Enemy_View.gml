/*

	Classe que gestiona com veuen i senten els enemics al player
	
	Presuposa que al layer de colisions el 0 es buit i el 1 es colision
	Mirem contra "hurtbox"

	in
	- eyes_offset: distancia des de la y de l'enemic fins els ulls


*/


function Enemy_View(_eyes_offset, _view_distance, _view_angle, _hear_distance) constructor {


	// parametre player
	view_distance = _view_distance;		// per sota detecta en cone of sight (direccio +- view_angle)
	view_angle = _view_angle;
	hear_distance = _hear_distance;					// per sota detecta en qualsevol direccio si no hi ha obstacle
	eyes_offset = _eyes_offset;			// on te el cap respecte x,y del player
	
	// dades player per aquest step
	my_x = -1;     
	my_y = -1;
	my_direction = -1;
	player_x = -1;
	player_y = -1;

	player_detected_in_this_step = false;
	
	// punt on esta mirant en aquest step. Line Of Sigth = (x,y-yViewOffset)-->(xView, yView)
	xView = -1;
	yView = -1;
	xView2 = -1;
	yView2 = -1;
	xView3 = -1;
	yView3 = -1;
	// punt on es talla la LOS amb una paret
	xView_LOS = -1;     
	yView_LOS = -1;		


	
	// update instance variables 
	// cal cridar-la en cada step
	
	function step(_x, _y, _direction, _player_x, _player_y) {
		my_x = _x;
		my_y = _y - eyes_offset;
		my_direction = _direction;
		player_x = _player_x;
		player_y = _player_y;
		player_detected_in_this_step = false;		// reset for this step
	}


	// es crida des de draw. pinta el COS
	
	function draw_line_of_sigth() {
		
		// direction with hear distance
		xView = my_x + lengthdir_x(hear_distance, my_direction);
		yView = my_y + lengthdir_y(hear_distance, my_direction);
		
		// cone of sight with view distance
		xView2 = my_x + lengthdir_x(view_distance, my_direction+view_angle);
		yView2 = my_y + lengthdir_y(view_distance, my_direction+view_angle);
		xView3 = my_x + lengthdir_x(view_distance, my_direction-view_angle);
		yView3 = my_y + lengthdir_y(view_distance, my_direction-view_angle);
	
		draw_set_color(c_purple);
		draw_line(my_x,my_y,xView,yView);
		draw_line(my_x,my_y,xView2,yView2);
		draw_line(my_x,my_y,xView3,yView3);
		
		// linia al player
		if player_detected_in_this_step == true then {
			draw_set_color(c_green);
			draw_line(my_x,my_y,player_x,player_y);
		}
		
		
		//draw_set_color(c_green);
		//draw_line(my_x+1,my_y+1,xView_LOS+1,yView_LOS+1);
		draw_set_color(c_black);
	}
	
	
	

	/*
		Valora si player esta en el cone of sight (COS) o si el sent
		COS es defineix per tres punts
		- punt 1: posicio xy corregida
		- punts 2 i 3: modul distancia_vista i angle direccio +- angle
		
				NOTA: PERQUE MIREM NOMES LA POSICIO DEL PLAYER. 
				HAURIEM DE MIRAR ELS EXTREMS DEL SEU HURTBOX  <-----
		
		
		in: 
			- posicio del player
			- view_distance
			- hear_distance
			
		out: 
			- true si esta en COS
			- player_detected_in_this_step
	
	
	*/
	function enemy_can_see_player(){
		
		// no recalcula al mateix step
		if (player_detected_in_this_step) 
			return true;
			
		var _ret = false;
		var _xTo = player_x;
		var _yTo = player_y;
		var _dist = point_distance(my_x, my_y, _xTo, _yTo);
		var _dir = point_direction(my_x, my_y, _xTo, _yTo);
		
		if (_dist > view_distance)
			// si esta massa lluny no el podem veure
			_ret = false;
		else 
			if (_dist < hear_distance)
				// si esta molt aprop el sentirem sempre que no hi hagi obstacle
				_ret =_can_see(_xTo, _yTo);
			else {
				// si esta entre mig mirem si esta en cone of sight i si no hi ha obstacle
				if abs(_dir - my_direction) < view_angle
					_ret = _can_see(_xTo, _yTo);
				else
					_ret =  false;
			}
			
	if _ret == true then
		player_detected_in_this_step = true;
		
	return _ret;
		
	}
	
	/*
		Mira si hi ha un obstacle (tile) entre la meva posicio (corregida) i un punt donat
		
		in: 
			- punt on miro
			- global.col_tile_layer
		out:
			- return true si no hi ha cap tile
			- x,yView_LOS  - es el punt on miro o, si hi ha colisio, el punt de col.lisio per pintar quan hi ha obstacles
				
	*/
	function _can_see(_xTo, _yTo) {
			
		#macro TILE_LINE_COLLISION_DISTANCE_BETWEEN_CHECKS  1

			//var _y_corregida = my_y - yViewOffset;
			var _ret = true;
			var _layer = global.col_tile_layer;
			xView_LOS = _xTo;
			yView_LOS = _yTo;
			var _dist = point_distance(my_x,my_y,_xTo,_yTo);
			var _dir = point_direction(my_x,my_y,_xTo,_yTo);


			// fem una linia des de la meva posicio fins a la posicio de desti
			// anem mostrejant i mirant si col.lisionem en un tile
			// si col.lisionem, marquem aquest punt en x,yView_LOS
			for(var d = 0; d < _dist; d+=TILE_LINE_COLLISION_DISTANCE_BETWEEN_CHECKS){
				var _lenX = lengthdir_x(d,_dir);
				var _lenY = lengthdir_y(d,_dir);
				var _tile = tilemap_get_at_pixel( _layer, my_x+_lenX, my_y + _lenY);
				if (_tile == 1) {	// collision
					xView_LOS = my_x+_lenX;
					yView_LOS = my_y +_lenY;
					_ret = false;
					break;
				}
			}
			
			// mirem si des de nosaltres fins a la paret o distancia maxima hi ha el hurtbox del player
			// <---- aixo es una mica extrany. si ja sabem que hi ha una paret davant per que estem 
			// tornant a mirar?  <-----
			/*
			var _id = collision_line(my_x, my_y, xView_LOS, yView_LOS, obj_hurtbox_player, false, true);
			if (_id!=noone) {
				_ret=true;
			}
			

		if _ret==false {
			xView_LOS = my_x;
			yView_LOS = my_y;
		}
		*/

		return _ret;
	}

}