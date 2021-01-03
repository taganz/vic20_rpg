/// @desc activate NPC


function activate_NPC() {


	with (activate) {
		
		if (argument[0]!= -1) {	
			dialogue(argument[0]);	// sets next_state
		}
	}

	
}
