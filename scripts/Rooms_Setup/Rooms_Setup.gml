
/*

	gestio de parametres de les rooms
		- entries: son destins de transitions. tenen una lletra (N, S, W, E, ....) i un punt
		- dialogues: dialegs que es llencen quan el player entra a la room (els llença el game?)
	
	
	
	
	entries:
		les rooms poden tenir dos tipus de entries
			- un punt --> han de tenir entrada en _map_entries
			- tot el perimetre --> no cal fer entrada, es automatic
		
		quan es demana una entry primer es mira si te una de punt, si la troba la torna
		si no en te i la entry es de tipus NWSE col.locara el player a on li toqui
			- aixo nomes funciona per les de 800 x 600  - STD_ROOM_W, STD_ROOM_H !!!
					--> caldria mirar el size del room i calcular-ho??
	
		per salta de room de forma continua es pot posar el entryCode en blanc ""

*/



function _Entry(_x, _y, _player_direction_after) constructor {
	 x= _x;
	 y= _y;
	 player_direction_after = _player_direction_after;
	 
	 to_string = function() {
		 return "("+string(x)+", "+string(y)+", "+string(player_direction_after)+")";
	 }
}

function Rooms_Setup() constructor {

	last_save_room = -1;				// room a la que cal tornar quan et matin


	_map_entries = ds_map_create();		// rooms amb entries que son punts
	_map_dialogues = ds_map_create();		// rooms amb entries que son punts
	_map_save_rooms = ds_map_create();		// rooms que permeten salvar
	_list_save_rooms_used = ds_list_create();		// rooms que ja hem guardat per no matxacar avanç
		
	
	// === DECLARACIO DE ROOMS DEL JOC   

	// --- ENTRIES DE LA ROOM

	//         _map_entries:    room name_EntryCode    x    y   player_direction_after
	
	ds_map_add(_map_dialogues, "rm_cella", 10);    // "despiertas..."
	ds_map_add(_map_entries,   "rm_cella_S", new _Entry(431, 287, 90));
	
	ds_map_add(_map_entries,   "rm_preso_aranyes_W", new _Entry(80, 127, 0));
	ds_map_add(_map_entries,   "rm_preso_aranyes_E", new _Entry(735, 336, 180));
	
	ds_map_add(_map_entries,   "rm_preso_sigilo_W", new _Entry(63, 125, 0));
	ds_map_add(_map_entries,   "rm_preso_sigilo_E", new _Entry(734, 316, 180));

	ds_map_add(_map_entries,   "rm_centre_E", new _Entry(44, 428, 0));
	
	
	// --- DIALEGS INICIALS DE LA ROOM
	
	ds_map_add(_map_dialogues, "rm_desert_cova", 330);

	// --- DIALEGS INICIALS DE LA ROOM i entry de respawn
	
	ds_map_add(_map_save_rooms,   rm_centre,				new _Entry(44, 428, 0));
	ds_map_add(_map_save_rooms,   rm_desert_cova_monjo,		new _Entry(415, 480, 270));
	ds_map_add(_map_save_rooms,   rm_desert_cova,			new _Entry(415, 480, 270));

	
	// === torna la entry {x, y, orientacio} associada a una room i un entry code. es fa servir a player_room_transition 
	
	get_entry = function (_room, _entryCode) {
		var _entry = room_get_name(_room)+"_"+_entryCode;
		if (ds_map_exists(_map_entries, _entry)) {
			// tenim una entry tipus punt
			return _map_entries[? _entry];
		}
		else {
			// si no calculem la posicio a manija
			var _x = -1;
			var _y = -1;
			var _player_direction_after = 270;
			switch(_entryCode) {
				case "N": _y = 60; _player_direction_after = 270; break
				case "W": _x = 60; _player_direction_after = 0; break
				case "S": _y = STD_ROOM_H - 60; _player_direction_after = 90; break
				case "E": _x = STD_ROOM_W - 60; _player_direction_after = 180; break
			}
			return new _Entry(_x, _y, _player_direction_after);
			
		}
	}
	
	// === torna el dialeg inicial associat a la room o -1
	
	get_dialogue = function (_room) {
		if (ds_map_exists(_map_dialogues, _room))
			return _map_dialogues[? _room];
		else
			return -1;
		
	}
	
	
	// === nomes torna entries de moment
	
	to_string = function (_entry) {
		if (ds_map_exists(_map_entries, _entry))
			return _map_entries[? _entry].to_string();
		else
			return "*** Rooms_Setup Entry NOT FOUND ***"+string(_entry);
	}
	
	
	// === SAVE ROOMS
	
	// --- room exit: guarda ultima room en "last_save_room" si es una save room
	
	room_exit = function(_room) {
		// si es una save room i si no l'hem guardat ja abans (esta tornant endarerra)
		if ds_map_exists(_map_save_rooms, _room) 
			&& ds_list_find_index(_list_save_rooms_used, _room)==-1 {
				
		// update last_save_room amb la darrera room 
			last_save_room = _room;
			// despres la guarda per no repetir
			ds_list_add(_list_save_rooms_used, _room);
		}
	}
	
	// --- torna la Entry de la darrera save room
	
	get_save_room_entry = function() {
		return _map_save_rooms[? last_save_room];
	}
	
}