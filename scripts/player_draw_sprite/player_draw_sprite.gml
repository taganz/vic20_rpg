

function player_draw_sprite(){
	
	// afegeix arma
	
	if (global.inventory.current_weapon != WEAPON.NOTHING) 
		spr_LPC_weapon   = global.inventory.current_weapon_sprite_LPC;
	else
		spr_LPC_weapon   = -1;
		
		
	// dibuixa
	
	draw_sprite_LPC_sheet(1);
	
	previous_sprite_state = sprite_state;

}