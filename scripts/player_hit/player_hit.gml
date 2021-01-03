// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hit(_hitbox){

	with (obj_player) {
		
		if (RUN_AS_DEBUG && (DEBUG_VIDES_INFINITES == true)) == false 
			global.player_health -= _hitbox.attack_points;;
			
		stun_time = _hitbox.stun_time;
		//flash = true;
		
		if (global.player_health > 0)
		{
			next_state = PLAYERSTATE.HURT;
			//hitNow = true;
		}
		else
		{
			if (next_state != PLAYERSTATE.DEAD) {
				next_state = PLAYERSTATE.DIE;
			}
		}
	}

}