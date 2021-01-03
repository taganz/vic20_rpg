

/*
	enemy_distance_attack: si el player esta mes aprop ataca. si no el persegueix

	in:
		- enemy_attack_delay_between_attacks: no torna a atacar fins que passa aquest temps
		- enemy_attack_points
		- enemy_attack_stun_time
		

*/


function enemy_state_attack(){
	
	// === state entry
	
	if (state_entry) {
		time_since_last_attack = 0;
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		//xTo = x + lengthdir_x(enemy_distance_wander, direction);
		//yTo = y + lengthdir_y(enemy_distance_wander, direction);
		sprite_state = SPRITE.SLASH;
	}

	xTo = obj_player.x;
	yTo = obj_player.y;
	var _distanceToPlayer = point_distance(x,y,xTo,yTo);
	
	
	// === si l'ha matat --> IDLE
	
	if (global.player_health <= 0)
		next_state = ENEMYSTATE.IDLE;
		
	// === si enemic escapa --> CHASE
	
	else if (_distanceToPlayer > enemy_distance_attack) {
		next_state = ENEMYSTATE.CHASE;
	}
	else {
				
		// === ATACA si ha passat temps des de darrer atac
		
		if (time_since_last_attack <= 0) {
			var _facing = clamp(round(direction/90), 0, 3);
			// crea el hitbox 
			var _xx = 0;
			var _yy = 0;
			var _spr = -1;
			if (_facing == 0) {_xx = + 32;	_spr = spr_attack_slash_E;}
			if (_facing == 1) {_yy = - 32;	_spr = spr_attack_slash_N;}
			if (_facing == 2 ) {_xx = - 32;	_spr = spr_attack_slash_W;}
			if (_facing == 3) {_yy = + 32;	_spr = spr_attack_slash_S;}
			hitbox = hitbox_create(_spr, 1, 1, _xx, _yy, -1, enemy_attack_points, enemy_attack_stun_time);
			time_since_last_attack = enemy_attack_delay_between_attacks;
		}

		time_since_last_attack--;
		
	}
			
	
}