
/*
	Dibuixa sprite corresponent de full LPC Universal Sprite Sheet
	Per player i per enemy
	
	in:
		- frame_size:		tamany sprites del sheet per passar de frame a pixel
		- spr_base, spr_feet, spr_legs,...  : sheets 
		- x, y:				on pintar
		- sprite_state:		linia del sheet a pintar
		- x_frame:			columna dels sheet a pintar
	out:
		- x_frame:			l'incrementa
		- anim_length:		per si alguna funcio ha de detectar que hem arribat al final de l'animacio


	// LPC Universal Sprite Sheet
	// https://github.com/jrconway3/Universal-LPC-spritesheet
	
	
*/


function draw_sprite_LPC_sheet(_LPC_scale){



	var _y = 0;	// pos top left del sprite a dibuixar (en pixels)
	var _facing = round(direction/90);
	var _increment_frame = false;
	animationEnd = false;
	
	// per defecte si canvia d'estat posem primer frame. pot ser que despres algun estat seleccioni un 
	// sprite diferent, com dead
	if (previous_sprite_state != sprite_state) {
		x_frame = 0;
	}

	
	// === SELECCION ROW
	
	// primera linia de l'estat en el sheet
	switch(sprite_state) {
		case SPRITE.SPELL:	 
			_y = 0;
			anim_length = 7;
			switch(_facing) {
				case 0:	_y+=3; break;
				case 1:	_y+=0; break;
				case 2: _y+=1; break;
				case 3:	_y+=2; break;
			}
			_increment_frame = true;
			break;
		case SPRITE.THRUST:	 
			_y = 4;
			anim_length = 8; 
			switch(_facing) {
				case 0:	_y+=3; break;
				case 1:	_y+=0; break;
				case 2: _y+=1; break;
				case 3:	_y+=2; break;
			}
			_increment_frame = true;
			break;
		case SPRITE.IDLE:	
			_y = 10;   // 8 + 2
			anim_length = 1; 
			switch(_facing) {
				case 0:	_y+=1; break;
				case 1:	_y+=2; break;
				case 2: _y+=3; break;
				case 3:	_y+=0; break;
			}
			_increment_frame = false;
			break;
		case SPRITE.CHASE:
		case SPRITE.WALK:
			_y = 8;
			anim_length = 9; 
			switch(_facing) {
				case 0:	_y+=3; break;
				case 1:	_y+=0; break;
				case 2: _y+=1; break;
				case 3:	_y+=2; break;
			}
			_increment_frame = true;
			break;
		case SPRITE.SLASH:	 
			_y = 12; 
			anim_length = 6; 
			switch(_facing) {
				case 0:	_y+=3; break;
				case 1:	_y+=0; break;
				case 2: _y+=1; break;
				case 3:	_y+=2; break;
			}
			_increment_frame = true;
			break;
		case SPRITE.SHOOT:	 
			_y = 16; 
			anim_length = 13; 
			switch(_facing) {
				case 0:	_y+=3; break;
				case 1:	_y+=0; break;
				case 2: _y+=1; break;
				case 3:	_y+=2; break;
			}
			_increment_frame = true;
			break;
		case SPRITE.DIE:
		case SPRITE.HURT:
			_y = 20; 
			anim_length = 6; 
			_increment_frame = true;
			break;
		case SPRITE.DEAD:	 
			_y = 20; 
			x_frame = 5;
			_increment_frame = false;
			anim_length = 1; 
			break;
		default: show_debug_message("*** ERROR *** player_draw_sprite_lpc_sheet, error sprite_type:"+string(sprite_state));
	}

	
	// passa linia a pixels
	_y = _y * 64;

	
	// incrementem frame
	if (previous_sprite_state == sprite_state && _increment_frame) {	
		x_frame += anim_speed / room_speed;
		if (x_frame >= anim_length ) {
			x_frame = 0;
			animationEnd = true;
		}
	}
	
			
	
	// == DIBUIXA
	
	// els sprite_part no coneixen el seu offset
	//var _xx = x-32;
	//var _yy = y-60;
	var _xx = x-32*_LPC_scale;
	var _yy = y-60*_LPC_scale;

	
	// DRAW SHADOW
	if (spr_shadow != -1) draw_sprite(spr_shadow, 0, x, y);    // <---- caldria escalar la sombra


	// DRAW CHARACTER BASE
	if (spr_LPC_base != -1) draw_sprite_part_ext(spr_LPC_base, 0, floor(x_frame) * frame_size, _y, frame_size, frame_size, _xx, _yy, LPC_scale, LPC_scale, c_white, 1);
	
	
	// DRAW CHARACTER FEET
	if (spr_LPC_feet != -1) draw_sprite_part_ext(spr_LPC_feet, 0, floor(x_frame) * frame_size, _y, frame_size, frame_size, _xx, _yy, LPC_scale, LPC_scale, c_white, 1);

	// DRAW CHARACTER LEGS
	if (spr_LPC_legs != -1) draw_sprite_part_ext(spr_LPC_legs, 0, floor(x_frame) * frame_size, _y, frame_size, frame_size, _xx, _yy, LPC_scale, LPC_scale, c_white, 1);

	// DRAW CHARACTER SHIRT
	if (spr_LPC_torso != -1) draw_sprite_part_ext(spr_LPC_torso, 0, floor(x_frame) * frame_size, _y, frame_size, frame_size, _xx, _yy, LPC_scale, LPC_scale, c_white, 1);

	// DRAW CHARACTER HAIR
	if (spr_LPC_hair != -1) draw_sprite_part_ext(spr_LPC_hair, 0, floor(x_frame) * frame_size, _y, frame_size, frame_size, _xx, _yy, LPC_scale, LPC_scale, c_white, 1);

	// DRAW CHARACTER WEAPON
	if (spr_LPC_weapon != -1) draw_sprite_part_ext(spr_LPC_weapon, 0, floor(x_frame) * frame_size, _y, frame_size, frame_size, _xx, _yy, LPC_scale, LPC_scale, c_white, 1);	

}