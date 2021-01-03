function player_state_hurt() {
	
	if (state_entry) {
		sprite_state = SPRITE.HURT;
		timePassed = 0;
	}


	// s'ha recuperat	
	if (timePassed > stun_time) 
	{
		//frameCount = 0;
		next_state = PLAYERSTATE.FREE;
	}
	else 
	// segueix atontat
	{
		timePassed++;
	}

	// es mor mentres
	if (global.player_health <= 0) {
		next_state = PLAYERSTATE.DIE;
	}


}
