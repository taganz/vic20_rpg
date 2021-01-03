// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_dead(){


	if (state_entry) {
		sprite_state = SPRITE.DEAD
	}
	
	dialogue(900);
	global.gamePaused = true;

// no puc canviar la instancia perque hi ha scripts que esperen tenir un obj_Player
//	instance_change(oCorpse32,true);


}