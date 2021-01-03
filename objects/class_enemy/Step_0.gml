
// Execute State Machine
if (!global.gamePaused)
{

	// ==== move hurtbox

	with (hurtbox) {
		x = other.x + xOffset;  // other es player 
		y = other.y + yOffset;
	}

	// === recalculate line of sight
	view.step(x, y, direction, obj_player.x, obj_player.y);


	// === execute state

	state_entry = (state!=next_state);
	if (state_entry) {
		previous_state = state;
		state = next_state;

	}
		
	if (enemy_script[state] != 1) script_execute(enemy_script[state]);  // si es -1 no sortira mai!! <--


	
	depth = -bbox_bottom;    // repetit en end step de obj_entity!
	
}