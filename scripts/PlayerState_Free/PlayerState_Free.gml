/// @description   Mou i canvia d'estat si ataca
function PlayerState_Free() {

	
	// ==== state entry
	
	if (state_entry == true) {
		sprite_state = SPRITE.IDLE;
		//mask_index = spr_character_collision_mask_feet;
	}

	
	// === moviment
	
	// actualitza velocitat segons input d'usuari
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
	
	// incrementa x/y/direction segons vSpeed/hSpeed controlant si hi ha colisio amb tiles o entities
	player_move_collision();  

	if (inputMagnitude != 0 )
		sprite_state = SPRITE.WALK;
	else
		sprite_state = SPRITE.IDLE;


	
	// === detecta room transition
	
	player_room_transition();


	// ==== canvi estat
	if (input_activate) {
		next_state = PLAYERSTATE.ACTIVATE_ENTITY;
	}	
	else if (input_attack) {
		if (global.inventory.current_weapon != WEAPON.NOTHING) {
			next_state = PLAYERSTATE.ATTACK_SLASH;
		}
		else {
			dialogue(1);   // necesitas un arma
		}
		
		
	}
}
