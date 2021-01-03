/*	Draw
	- Personatge
	- Debug info
	- Healt
	
*/


// === PERSONATGE

// -- draw shadow

draw_sprite(sShadow,0,floor(x),floor(y));


// ???
if (flash != 0)
{
	shader_set(shWhiteFlash);
	shader_set_uniform_f(uFlash, flash);
}

// -- dibuixa imatge principal

if (hSpeed+vSpeed>0 && state!=ENEMYSTATE.PATH)
	direction = point_direction(0,0,hSpeed,vSpeed);

switch(enemy_sprite_format) {
	case SPRITEFORMAT.LPC_SHEET:
		draw_sprite_LPC_sheet(enemy_image_scale);
		break;
	case SPRITEFORMAT.TIRA_E:
		draw_sprite_tira_E();
		break;
	case SPRITEFORMAT.TIRA_NWSE:
		draw_sprite_tira_NWSE();
		break;
	case SPRITEFORMAT.IMATGE: 
		draw_sprite_image();
		break;
}

previous_sprite_state = sprite_state;



// ???
if (shader_current() != -1) shader_reset();

// === DEBUG INFO

if (global.debug) {
	draw_set_font(fTextDebug)
	draw_set_color(c_black);
	draw_text(x, y-128, 
			"\nEstat:"+string(state)+"-"+state_to_string_enemy(state)
			+ "\nhp: "+string(hp)
			+ " dir: "+string(round(direction/90)*90)
			);

	// line of sight
	view.draw_line_of_sigth();
	
	// path
	if enemy_path != -1 {
		draw_set_color(c_green);
		 draw_path(enemy_path, x_init, y_init, true);  // absolute position
		draw_set_color(c_blue);
		 draw_path(enemy_path, x_init, y_init, false); // relative position
		draw_set_color(c_black);
	}
	
}

// === HEALTH 

//--- mostra salut si entra en atac

if (hp < enemy_hp || state == ENEMYSTATE.HURT || state == ENEMYSTATE.CHASE || state == ENEMYSTATE.ATTACK) {
	var _health = hp;						// salut
	var _healthMax = enemy_hp;			// salut maxima
	var _healthFrac = frac(_health);			
	_health -= _healthFrac;						// treiem la part decimal de la salut

	// pinta els N cors amb estat diferent segons salut

	for (var i = 1; i <= _healthMax; i++)				// per cada cor de salud maxima
	{
		var _imageIndex = (i > _health);				
		if (i == _health+1)							// si cor i no esta sencer
		{
			_imageIndex += (_healthFrac > 0);			// imatges sprite:   100%  0%  25%  50% 75% 
			_imageIndex += (_healthFrac > 0.25);
			_imageIndex += (_healthFrac > 0.5);
		}
		//draw_sprite(spr_health,_imageIndex,8 + ((i-1) * 16), 8);	// pinta cor N
		var _scale = 1;
		draw_sprite_ext(spr_health_enemy,_imageIndex
				, x - _healthMax * 16 * _scale / 2 + ((i-1) * 16*_scale)
				, y - 64
				, _scale, _scale, 0, c_white, 0.75);	// pinta cor N
	
	}

}