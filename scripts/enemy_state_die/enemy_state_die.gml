function enemy_state_die() {
	
	if (state_entry) {
		sprite_state = SPRITE.DIE;
		timePassed = 0;
	}


	if (enemy_sprite_format == SPRITEFORMAT.LPC_SHEET && animationEnd) {
		next_state = ENEMYSTATE.DEAD;
	}
	else {
		timePassed++;
		if (timePassed > 20) {
			next_state = ENEMYSTATE.DEAD;
		}
	}



}
