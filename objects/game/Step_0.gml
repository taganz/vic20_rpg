/// @description Global key commands


read_user_input();

if input_debug {
	global.debug = !global.debug;
	if (layer_exists("Col")) layer_set_visible("Col", global.debug);
	if (layer_exists("Transitions")) layer_set_visible("Transitions", global.debug);
	if (layer_exists("Collider")) layer_set_visible("Collider", global.debug);
	with (obj_hurtbox) visible = global.debug;
	with (obj_hurtbox_player) visible = global.debug;
	
	// camera, view, etc variables
	game_debug_screen_info();;
	
	
	} 
if input_game_restart  { dialogue(910); }
if input_game_end  { dialogue(920);}

if (keyboard_check_pressed(ord("1"))) { room_goto(rm_cella) }
if (keyboard_check_pressed(ord("2"))) { room_goto(rm_centre) }
if (keyboard_check_pressed(ord("3"))) { room_goto(rm_preso_2) }
if (keyboard_check_pressed(ord("4"))) { obj_player.x = 200; obj_player.y = 200; }
if (keyboard_check_pressed(ord("5"))) { room_goto(rm_castell); global.inventory.weapon_equip(WEAPON.DAGA); }
if (keyboard_check_pressed(ord("6"))) { room_goto(rm_debug); global.inventory.weapon_equip(WEAPON.DAGA); }
if (keyboard_check_pressed(ord("8"))) { obj_player.speedWalk /= 2 }
if (keyboard_check_pressed(ord("9"))) { obj_player.speedWalk *= 2 }
//#macro ROOM_START rm_desert_cami
// P per pause esta en End Step



/*
// missatge pantalla inicial

if (initial_help_shown == false) {
	//NewTextBox(TEXT_INITIAL_HELP);
	dialogue(10);
	initial_help_shown = true;
}
*/


if (input_help) {
	dialogue(2);
}

