/*
	follow path
	in
	- enemy_path
*/

function enemy_state_path(){

	// select destination and sprite
	
	if (state_entry) {
		timePassed = 0;
		//direction = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
		//xTo = x + lengthdir_x(enemy_distance_wander, direction);
		//yTo = y + lengthdir_y(enemy_distance_wander, direction);
		sprite_state = SPRITE.WALK;
		
		path_started = true;   // nomes arranca un cop
	
		if (enemy_path == -1)
			show_debug_message("*** ERROR ENEMY PATH EN ENEMY STATE PARTH");
			
		var _n = path_get_name(enemy_path);
		if (string_copy(_n, 1, 13) == "path_circular") {
			path_start(enemy_path, enemySpeed, path_action_restart, false);
		}
		else {
			path_start(enemy_path, enemySpeed, path_action_reverse, false);
		}
		
	}


	
	timePassed++;
		
	// collide & move 
		
	//enemy_move_tile_collision();    // <--- detectar collision i parar?
		
	// si xoca surt del path
		
	if (tilemap_get_at_pixel(collisionMap,x,y)) {
		path_end();
		next_state = ENEMYSTATE.IDLE;
	}
		
	// player is in line of sight?
	else if (view.enemy_can_see_player()) {
			
		path_end();
			
		// if player detected change state to CHASE
		if (point_distance(x,y,obj_player.x, obj_player.y) < enemy_distance_attack) {
			next_state = ENEMYSTATE.ATTACK;
		}
		else 
		{
			next_state = ENEMYSTATE.CHASE;
		}
	}	
	

		
		

}