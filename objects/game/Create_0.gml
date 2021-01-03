/// @description Init game


// -- game setup

randomize();
global.debug=false;
global.gamePaused = false;
global.textSpeed = .75;
initial_help_shown = false;
global.player_initialized = false;

// gestio de rooms
rooms = new Rooms_Setup();
restart_game_at_save_room = false;

global.iUI = -1;

// == game state

global.iLifted = noone;   // objecte aixecat
global.text_box_player_previous_state = -1;		// conserva estat quan es posa en LOCKED

global.player_health = PLAYER_VIDES;
global.player_health_max = PLAYER_VIDES;
if RUN_AS_DEBUG {
	global.player_health = DEBUG_VIDES_PLAYER;
	global.player_health_max = DEBUG_VIDES_PLAYER;
		
}

// -- inventory

global.inventory = new Inventory();
if RUN_AS_DEBUG {
	if DEBUG_TINC_DAGA {
		global.inventory.weapon_equip(WEAPON.DAGA);
	}
	if DEBUG_TINC_RELIQUIES {
		global.inventory.add_item(ITEM.RELIQUIA_1);
		global.inventory.add_item(ITEM.RELIQUIA_2);
		global.inventory.add_item(ITEM.RELIQUIA_3);
	}
}


// -- room transitions

/*
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.spawnX = -1;
global.spawnY = -1;
*/
				
//global.targetDirection = 0;


// -- camara

global.iCamera = instance_create_layer(0,0,layer,obj_camera);

surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);


// -- go to first screen

if RUN_AS_DEBUG == false
	room_goto(ROOM_START);
else
	room_goto(DEBUG_ROOM_START);
	


guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

// === TRANSITIONS

blackAlpha = 0;
spawnRoom = -1;
spawnX = -1;
spawnY = -1;
spawn_player_direction_after = -1;
spawnEntry = -1;
doTransition = false;

enum dir {   // <--- on es fa servir? cal treure?
	right = 0,
	up    = 90,
	left  = 180,
	down  = 270
}



