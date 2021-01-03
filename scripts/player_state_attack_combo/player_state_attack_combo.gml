// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_attack_combo() {


// <--- PENDENT DE REPASSAR AIXO


	// ==== state entry
	if (state_entry == true) {
		sprite_state = SPRITE.SHOOT;	
		//instance_create_layer(x, y-32, "Instances", obj_combo_hitbox);
		hitbox = hitbox_create(1, 1, x, y-32, -1, 1, 10, spr_attack_combo);
		//mask_index = spr_character_collision_mask_feet;
	}



	if (animationEnd) {
		next_state = PLAYERSTATE.FREE;
	}




}
