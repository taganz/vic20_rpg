// es crida des de la "victima"
// resta hp al objecte, fa flash, el mata si hp = 0
function enemy_hit(_hitbox) {
	
	with (other.owner) {
		hp -= _hitbox.attack_points;
		stun_time = _hitbox.stun_time;

		//flash = true;
		if (hp > 0)
		{
			next_state = ENEMYSTATE.HURT;
			//hitNow = true;
		}
		else
		{
			if (next_state != ENEMYSTATE.DEAD) {
				next_state = ENEMYSTATE.DIE;
			}
		}
	}

}
