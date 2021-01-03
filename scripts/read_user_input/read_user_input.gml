
// ojo, com que llegeixo aixo un cop en un mateix lloc
// si es fa servir dues vegades una que sigui checked cal ressetejar-ho el primer cop 
// per evitar que repeteixi

function read_user_input(){
	
	
	#macro TEXT_INITIAL_HELP "AWSD to move...\n<space> to use things and messages...\n<h> for help..."
	#macro TEXT_HELP "AWSD: move. V/CONTROL: attack. Space: interact.\nC+cursor: move camera. ESC: exit"
	#macro TEXT_COMO_ATACAR "<V> o <CONTROL> para atacar"
	#macro TEXT_COMO_SPEED_RUN "<SHIFT> para SPEED RUN"

	input_help			= keyboard_check_pressed(ord("H"));
	
	input_left			= keyboard_check(ord("A"));
	input_right			= keyboard_check(ord("D"));
	input_up			= keyboard_check(ord("W"));
	input_down			= keyboard_check(ord("S"));
	
	//input_walk			= keyboard_check(vk_control);
	input_run			= keyboard_check(vk_shift);
	
	input_attack		= keyboard_check_pressed(ord("V")) || keyboard_check_pressed(vk_control);
	input_activate		= keyboard_check_pressed(vk_space);  // read signs, interact with entities
	
	input_camera_move	= keyboard_check(ord("C"));
	input_camera_left   = keyboard_check(vk_left);
	input_camera_right  = keyboard_check(vk_right);
	input_camera_up     = keyboard_check(vk_up);
	input_camera_down   = keyboard_check(vk_down);
	
	input_debug			= keyboard_check_pressed(ord("0"));
	input_game_restart	= keyboard_check_pressed(ord("R"));
	input_game_end		= keyboard_check_pressed(vk_escape);
	input_game_pause	= keyboard_check_pressed(ord("P"));			// nomes para animacions <---
	
	input_msg_text_box_up	 = keyboard_check_pressed(ord("W")) || keyboard_check(vk_up); 
	input_msg_text_box_down	 = keyboard_check_pressed(ord("S")) || keyboard_check(vk_down);
	input_msg_text_box_enter = keyboard_check_pressed(vk_space); 
	//|| keyboard_check_pressed(vk_enter);  // diferent de space per a que no entri en bucle als missatges

}