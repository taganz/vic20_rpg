/// @description Room transition

if (doTransition) {
	
	// Handle Black room fade
	
	if (room != spawnRoom) {       
		
		// esta a la room origen --> posa a negre
		blackAlpha += 0.1;
		if (blackAlpha >= 1) { 
			room_goto(spawnRoom); 
		}
		
	} else {
		
		// esta a la room desti --> posa a blanc
		blackAlpha -= 0.1;
		if (blackAlpha <= 0) {
			doTransition = false; 
			obj_player.x = spawnX;
			obj_player.y = spawnY;
			obj_player.direction = spawn_player_direction_after;   //  <--- no va be
			// ressetejem
			spawnRoom = -1;		
		}
	}
	
	
	// Draw black fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_colour(0,0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1);
}

