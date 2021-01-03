// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_to_string_enemy(_state){
	
	var _t= "???";
	switch(_state) {
		case ENEMYSTATE.IDLE: _t = "IDLE"; break;
		case ENEMYSTATE.WANDER: _t = "WANDER"; break;
		case ENEMYSTATE.PATH: _t = "PATH"; break;
		case ENEMYSTATE.CHASE: _t = "CHASE"; break;
		case ENEMYSTATE.ATTACK: _t = "ATTACK"; break;
		case ENEMYSTATE.HURT: _t = "HURT"; break;
		case ENEMYSTATE.DIE: _t = "DIE"; break;
		case ENEMYSTATE.DEAD: _t = "DEAD"; break;
		case ENEMYSTATE.WAIT: _t = "WAIT"; break;
	}
	
	return _t;	
	
}