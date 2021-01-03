// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_to_string_player(_state){
	
	var _t= "???";
	switch(_state) {
		case PLAYERSTATE.FREE: _t = "FREE"; break;
		case PLAYERSTATE.ATTACK_SLASH: _t = "ATTACK_SLASH"; break;
		case PLAYERSTATE.ATTACK_COMBO: _t = "ATTACK_COMBO"; break;
		case PLAYERSTATE.ACTIVATE_ENTITY: _t = "ACTIVATE_ENTITY"; break;
		case PLAYERSTATE.LOCKED: _t = "LOCKED"; break;
		case PLAYERSTATE.ROLL: _t = "ROLL"; break;
		case PLAYERSTATE.HURT: _t = "HURT"; break;
		case PLAYERSTATE.DIE: _t = "DIE"; break;
		case PLAYERSTATE.DEAD: _t = "DEAD"; break;
	}
	return _t;	
	
}