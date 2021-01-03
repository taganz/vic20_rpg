/*

	in
		- enemy_speed
		- enemy_distance_attack
		- enemy_distance_chase
		- state_entry
	out
		- x, y, xTo, yTo, hSpeed, vSpeed, direction
		- sprite_state, next_state

*/

function enemy_state_chase(){
	
	if (state_entry) {
		sprite_state = SPRITE.CHASE;
	}

	// objectiu es player
	xTo = obj_player.x;
	yTo = obj_player.y;
	var _distanceToPlayer = point_distance(x,y,xTo,yTo);
	
	
	// si encara el veiem
	if (view.enemy_can_see_player()) {
		
		// === enemic enganxat --> ATTACK
	
		if (_distanceToPlayer < enemy_distance_attack) {
			next_state = ENEMYSTATE.ATTACK;
		}
	

		// === seguim persecucio --> CHASE
	
		else {
		
			direction = point_direction(x,y,xTo,yTo);
			if (_distanceToPlayer > enemySpeed)
			{
				hSpeed = lengthdir_x(enemySpeed,direction);
				vSpeed = lengthdir_y(enemySpeed,direction);
			}
			else
			{
				hSpeed = lengthdir_x(_distanceToPlayer,direction);
				vSpeed = lengthdir_y(_distanceToPlayer,direction);		
			}
	
			//Collide & move
			enemy_move_tile_collision();
		}

	}
	else {
		// l'hem perdut
		next_state = ENEMYSTATE.IDLE;
	}
}