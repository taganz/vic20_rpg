/// @desc activate chest: open and dialogue/close
/// @returns change next_state
/// @arg dialogue num optional


function chest_toggle_dialogue() {


	with (activate) {
		
		// estava tancat l'obre 
		if (image_index) == 0 then {
			image_index = 1;			
			if (argument[0]!= -1) {	
				dialogue(argument[0]);	// sets next_state
			}
			else {
				obj_player.next_state = PLAYERSTATE.FREE;   
			}

		}
		// si estava obert el tanca
		else {
			obj_player.next_state = PLAYERSTATE.FREE;   
			image_index = 0;
		}
	}
	
}
