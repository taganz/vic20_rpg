/// @description input, estats

// ====== UPDATE INPUT

read_user_input();

// shaun <--- treure
keyRight = input_right;
keyLeft = input_left;
keyDown = input_down;
keyUp = input_up;

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
if input_run && global.inventory.has_item(ITEM.POWER_SPEED_RUN)
	inputMagnitude*=2;
if (keyRight || keyLeft || keyDown || keyUp)  && state !=PLAYERSTATE.LOCKED
	direction = inputDirection;


// ==== hurtbox

with (hurtbox) {
	x = other.x + xOffset;  // other es player 
	y = other.y + yOffset;
}

//  ===== PROCESS ESTAT ACTUAL

if (!global.gamePaused) {

	if (state!=next_state) {
		previous_state = state;
		state = next_state;
		state_entry = true;
		frames_in_state = 0;
	}

	switch(state)
	{
		case PLAYERSTATE.FREE: PlayerState_Free(); break;
		case PLAYERSTATE.ATTACK_SLASH: player_state_attack_slash(); break;
		case PLAYERSTATE.ATTACK_COMBO: player_state_attack_combo(); break;
		case PLAYERSTATE.ACTIVATE_ENTITY: player_state_activate_entity(); break;
		case PLAYERSTATE.LOCKED: PlayerState_Locked(); break;
		case PLAYERSTATE.ROLL: PlayerState_Roll(); break;
		case PLAYERSTATE.HURT: player_state_hurt(); break;
		case PLAYERSTATE.DIE: player_state_die(); break;
		case PLAYERSTATE.DEAD: player_state_dead(); break;
	}
	state_entry = false;
	frames_in_state++;
	
}


