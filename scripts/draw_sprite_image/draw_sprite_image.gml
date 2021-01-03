/*
	in
		- hSpeed, vSpeed
		- spr_walk, spr_idle
	out
		

*/

function draw_sprite_image(){

	
	// === UPDATE SPRITE INDEX			
	
	
	// <---- per que vull tocar image_speed???
	
	switch(sprite_state) {
		case SPRITE.SPELL:
			sprite_index = spr_spell;
			break;
		case SPRITE.THRUST:
			sprite_index = spr_thrust;
			break;
		case SPRITE.SLASH:	 
			sprite_index = spr_slash;
			break;
		case SPRITE.CHASE:	 
			sprite_index = spr_chase;
			break;
		case SPRITE.SHOOT:
			sprite_index = spr_shoot;
			break;
		case SPRITE.HURT:	 
			sprite_index = spr_hurt;
			break;
		case SPRITE.WALK:	 
			sprite_index = spr_walk;			
			break;
		case SPRITE.IDLE:	 
			sprite_index = spr_idle;
			break;
		case SPRITE.DEAD:	 
			sprite_index = spr_dead;
			break;
	}
	
	if (previous_sprite_state != sprite_state) {
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

