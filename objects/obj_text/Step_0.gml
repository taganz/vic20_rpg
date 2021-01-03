/// @description Inserte aquí la descripción

// == Selecciona resposta amb cursor o WS, selecciona amb space


lerpProgress += (1 - lerpProgress) /50;
textProgress += global.textSpeed;

x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);

//Cycle through responses
read_user_input();
responseSelected += (input_msg_text_box_down - input_msg_text_box_up);
var _max = array_length_1d(responses)-1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;



//End Message
if (input_msg_text_box_enter)
{
	var _messageLength = string_length(message)
	if (textProgress >= _messageLength)
	{
		if (responses[0] != -1)
		{
			//with (originInstance) dialogueResponses(other.responseScripts[other.responseSelected]);
			with (originInstance) dialogue(other.responseScripts[other.responseSelected]);
		}
		
		
		instance_destroy();
		if (instance_exists(obj_text_queued))
		{
			with (obj_text_queued) ticket--;	
		}
		else
		{
			//with (oPlayer) state = lastState;	  
//			with (obj_player) next_state = global.text_box_player_previous_state;	  
			with (obj_player) {
				next_state = PLAYERSTATE.FREE;	  
				io_clear();  // per evitar rebots i que torni a activar 
			}
				
		}
	}
	else
	{
		if (textProgress > 2)
		{
			textProgress = _messageLength;
		}
	}
}