/// @description Enemic

// audio_play_sound(SOUND_HIT, 1, false);


// si no li hem donat (no esta en la ignore list), dona-li

if (ds_list_find_index(ignore_list, other.id) ==-1) {
	
	// si no estiguem pegant al hurtbox de l'atacant
	if (other.id.owner != owner) {
	
		// enviem hit a other
		player_hit(id);
		
	}

	// guarda other a la llista per evitar tornar-li a donar
	ds_list_add(ignore_list, other.id);

}

