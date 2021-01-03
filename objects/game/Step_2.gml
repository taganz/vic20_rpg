/// @desc Restart save & Pause 


// restart en save room

if restart_game_at_save_room {

	global.gamePaused = false;
	global.player_health = PLAYER_VIDES;
	var _entry = game.rooms.get_save_room_entry();
	game.spawnRoom = game.rooms.last_save_room;
	game.spawnX = _entry.x;
	game.spawnY = _entry.y;
	game.spawn_player_direction_after = _entry.player_direction_after;
	game.doTransition = true;
	
	room_goto(rooms.last_save_room);
	restart_game_at_save_room = false;

}

// user input es llegeix en step

else if (input_game_pause) {

	global.gamePaused = !global.gamePaused;

	// per tots els objectes guarda el image_speed (velocitat a la que es mouen els speeds) i ho posa a 0

	if (global.gamePaused)
	{
		with (all)
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
		
	}
	else
	{
		with (all)
		{
			image_speed = gamePausedImageSpeed;	
		}
	}

}