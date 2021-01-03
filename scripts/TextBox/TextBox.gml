/// @arg Message  -- string
/// @arg Background
/// @arg [Responses] -- array, p.ex  ["1:Resposta 1", "B:Resposta 2"]

// crea un objecte obj_text (o encua en obj_text_queued) 
// posa player en LOCKED (despres el obj_text el tornara a estat actual)


function TextBox() {


	var _obj;
	// creara un obj_text, o si ja n'hi ha un ho encua en un obj_text_queued
	if (instance_exists(obj_text)) _obj = obj_text_queued; else _obj = obj_text;
	with (instance_create_layer(0,0,"Instances",_obj))
	{
		message = argument[0];
		if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
		if (argument_count > 2)
		{
			//trim markers from responses
			responses = argument[2];
			for (var i = 0; i < array_length_1d(responses); i++)
			{
				var _markerPosition = string_pos(":",responses[i]);
				responseScripts[i] = string_copy(responses[i],1,_markerPosition-1);
				responseScripts[i] = real(responseScripts[i]);  // torna string en real
				responses[i] = string_delete(responses[i],1,_markerPosition);
				breakpoint = 10;
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}

	with (obj_player)
	{
		global.text_box_player_previous_state = state;
		next_state = PLAYERSTATE.LOCKED;
	}
		


}
