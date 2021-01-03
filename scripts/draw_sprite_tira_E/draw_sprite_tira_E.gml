/*
	in
		- hSpeed, vSpeed
		- spr_walk, spr_idle
	out
		- animationEnd

*/

function draw_sprite_tira_E(){

	
	// === UPDATE SPRITE INDEX			
	
	
	// <---- per que vull tocar image_speed???
	
	switch(sprite_state) {
		case SPRITE.SPELL:	
		case SPRITE.THRUST:
		case SPRITE.SLASH:	 
		case SPRITE.CHASE:	 
		case SPRITE.SHOOT:
		case SPRITE.HURT:	 
		case SPRITE.WALK:	 
			sprite_index = spr_walk;			
			image_speed = enemy_image_speed;	
			//x_frame += entity_image_speed;   // anim_speed / room_speed;
			//animationEnd = (image_index == sprite_get_number(sprite_index) -1);  // vull aixo?
			break;
		case SPRITE.IDLE:	 
			sprite_index = spr_idle;
			image_speed = 0.0;
			image_index = 0;
			//animationEnd = false;
			break;
		case SPRITE.DIE:	 
			sprite_index = spr_die;
			image_index = 0;
			animationEnd = false;
			break;
		case SPRITE.DEAD:	 
			sprite_index = spr_dead;
			image_speed = 0.0;
			image_index = 0;
			//animationEnd = false;
			break;
	}
	
	if (previous_sprite_state != sprite_state) {
		// comencem estat a principi de la tira
		image_index = 0;
		// mitja volta si va cap a W
		if (direction > 90 && direction < 270) {
			image_xscale *= -1;
		}		
	}



	// === Draw
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y-z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
}

