/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
//NineSliceBoxStretched(sTextBoxBg,x1,y1,x2,y2,background);
NineSliceBoxStretched(sTextBoxBg,x1Target,y1,x2Target,y2,background);
draw_set_font(fTextBasic);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _print = string_copy(message,1,textProgress)

//-- Add responses

// espera a que hagi escrit missatge
if (responses[0] != -1) && (textProgress >= string_length(message))
{
	for (var i = 0; i < array_length_1d(responses); i++)
	{
		_print += "\n";
		if (i == responseSelected) _print += "> ";
		_print += responses[i];
		if (i == responseSelected) _print += " <";
	}
}


draw_text((x1+x2) /2,y1+8,_print);
draw_set_color(c_white);
draw_text((x1+x2) /2,y1+7,_print);
