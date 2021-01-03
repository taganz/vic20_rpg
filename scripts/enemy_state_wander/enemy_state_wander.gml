
/*
   in 
   - xTo, yTo, 
   - timePassed			-- comptador per controlar temps maxim que caminara abans de parar-se 
   - enemy_distance_wander
   - enemySpeed
   - entity_image_speed
   
   out
   - sprite_state		-- canvia sprite
   - hSpeed, vSpeed		-- posa velocitat o la para si xoca o si arriba a desti
   - wait, timepassed	-- incrementa i/o resseteja
   - next_state			-- idle si porta massa temps
						   chase si player aprop
   

*/


function enemy_state_wander(){

	// select destination and sprite
	
	if (state_entry) {
		timePassed = 0;
		direction = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
		xTo = x + lengthdir_x(enemy_distance_wander, direction);
		yTo = y + lengthdir_y(enemy_distance_wander, direction);
		sprite_state = SPRITE.WALK;
		
	}


	
	// at destination or given up?
	
	if ((x == xTo) && (y == yTo)) || (timePassed > enemy_distance_wander / enemySpeed)
	{
		// parem
		hSpeed = 0;
		vSpeed = 0;
		next_state = ENEMYSTATE.IDLE;

	}
	else // move towards new destination
	{
		timePassed++;
		/*
		if (sprite_es_tira) {
			if (entity_image_speed == -1) 
				image_speed = 1.0;
			else 
				image_speed = entity_image_speed;	
		} 
		else {
			// actualitzem el frmae
			x_frame += entity_image_speed;   // anim_speed / room_speed;	
		}
		*/

		var _distanceToGo = point_distance(x,y,xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		direct = point_direction(x,y,xTo,yTo);
		direction = direct;
		hSpeed = lengthdir_x(_speedThisFrame, direct);
		vSpeed = lengthdir_y(_speedThisFrame, direct);
	//	if (hSpeed != 0) image_xscale = sign(hSpeed);    // gira sprite segons direcci!!
	
		// collide & move 
		
		enemy_move_tile_collision();
	

		// player is in line of sight?
		if (view.enemy_can_see_player()) {
			
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



}