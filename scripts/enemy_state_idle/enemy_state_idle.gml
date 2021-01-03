/*

	Entra en idle
	Espera un temps, va girant el cap
	Si veu el player el persegueix o l'ataca
	Passat el temps d'espera o va a path o va wander 
		si enemy_distance_wander = -1 es queda idle


*/

function enemy_state_idle() {
	
	
	if (state_entry) {
		if enemy_idle_time == -1 then
			idle_time = -1;    // always idle state except when see player
		else
			idle_time = room_speed * random_range(enemy_idle_time * 0.7, enemy_idle_time * 1.3);
		sprite_state = SPRITE.IDLE;
		timePassed = 0;
		view_angle2 = 0;    // sense el 2 interferia en algun nom intern i feia coses rares
		idle_entry_direction = direction;
	}

	// gira el cap
	

	
	if (view.enemy_can_see_player()) {
		
		if (point_distance(x,y,obj_player.x, obj_player.y) < enemy_distance_attack) {
			next_state = ENEMYSTATE.ATTACK;
		}
		else 
		{
			next_state = ENEMYSTATE.CHASE;
		}
	}
	else {
		
		// espera sense fer res, pero ves canviant direccio vista
		if (view_angle2 > 360 ){
			view_angle2 = 0; 
		}
		else {
			view_angle2 = view_angle2 + 1;    //   una volta cada 360 frames = 6 segons
		}
			
 		direction = idle_entry_direction + dsin(view_angle2)*45;		// sinus de periode 1200 frames   sin (t/120*360) * angle visio
		
		/*
		if (idle_time == -1 && timePassed < 3700)
			show_debug_message(
				string(id)
				+": "
				+string(timePassed)
				+", "
				+string(view_angle2)
				+", "
				+string(
					dsin(view_angle2)
					)
				+", "
				+string(
					idle_entry_direction +dsin(view_angle2)*45
					)
					);
		*/
		
		// si te timeout per sortir de idle
		timePassed++;
		if (timePassed > idle_time && idle_time != -1) {
			
			// si te un path i encara no l'ha fet, si no wander
			if (enemy_path != -1 && path_started == false)
				next_state = ENEMYSTATE.PATH;
			else
				// ha d'activar wander?
				if (enemy_distance_wander > 0)
					next_state = ENEMYSTATE.WANDER;
		}
	}

}
