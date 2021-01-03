function player_state_die() {
	
	if (state_entry) {
		sprite_state = SPRITE.DIE;
		timePassed = 20;
	}

	timePassed--;

	if (animationEnd || timePassed < 0) {      // <--- animationEnd no s'activa?
		next_state = PLAYERSTATE.DEAD;
	}



}
