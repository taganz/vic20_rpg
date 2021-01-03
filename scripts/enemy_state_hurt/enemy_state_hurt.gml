function enemy_state_hurt() {
	
	if (state_entry) {
		sprite_state = SPRITE.HURT;
		timePassed = 0;
		flash = 1;
	}


	// s'ha recuperat?	
	if (timePassed > stun_time) 
	{
		frameCount = 0;
		next_state = ENEMYSTATE.IDLE;
		flash = 0;
		
	}
	// segueix atontat
	else {
		timePassed++;
	}
	
	// si es mor metres
	if (hp < 0) {
		next_state = ENEMYSTATE.DIE;
	}


}
