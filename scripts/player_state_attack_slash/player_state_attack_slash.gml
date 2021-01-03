// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_attack_slash() {

	var _facing = round(direction/90);

	// ==== state entry
	if (state_entry ==  true) {
		
		sprite_state = SPRITE.SLASH;
		
		// crea el hitbox 
		var _xx = 0;
		var _yy = 0;
		var _spr = -1;
		if (_facing == 0) {_xx = + 32;	_spr = spr_attack_slash_E;}
		if (_facing == 1) {_yy = - 32;	_spr = spr_attack_slash_N;}
		if (_facing == 2 ) {_xx = - 32;	_spr = spr_attack_slash_W;}
		if (_facing == 3) {_yy = + 32;	_spr = spr_attack_slash_S;}
		hitbox = hitbox_create(_spr, 1, 1, _xx, _yy, -1, global.inventory.attack_points, global.inventory.stun_time);

	}
	

	// detecta combo
	if (input_attack) && (x_frame > 2) && global.inventory.te_combo 	{	
		next_state = PLAYERSTATE.ATTACK_COMBO;	
	}

	//si ha acabat animacio torna a estat free
	else if (animationEnd) {
		next_state = PLAYERSTATE.FREE;
	}


}
