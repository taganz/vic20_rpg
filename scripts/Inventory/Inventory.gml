
/*

		<--- HAURIA DE SER DIFERENT "ADD" QUE "WEAPON_EQUIP"
		
	
*/

enum WEAPON {
	NOTHING,
	DAGA,
	GLOVES,
	SWORD
}

enum ITEM {
	RELIQUIA_1,
	RELIQUIA_2,
	RELIQUIA_3,
	POWER_SPEED_RUN
}

function Inventory() constructor {

	// <--- aixo hauria de ser un map o algo aixi en comptes d'anar posant variables i switchos...
	
	_te_daga = false;
	_te_sword = false;
	te_combo = false;			// ENCARA ESTA EN PLAYER_STATE_ATTACK <-----
	_te_gloves = false;
	
	current_weapon = WEAPON.NOTHING;
	current_weapon_sprite = -1;		// per pintar en GUI
	current_weapon_sprite_LPC = -1;		// per pintar al player
	stun_time = 0;

	// ITEMS
	_list_dead_enemies = ds_list_create();	


	// ITEMS
	_list_items_in_inventory = ds_list_create();		// els que tinc a l'inventari
	_map_item_sprite = ds_map_create();					// els sprites de cada item
	ds_map_add(_map_item_sprite, ITEM.RELIQUIA_1, spr_reliquia_1);	  
	ds_map_add(_map_item_sprite, ITEM.RELIQUIA_2, spr_reliquia_2);	  
	ds_map_add(_map_item_sprite, ITEM.RELIQUIA_3, spr_reliquia_3);	  
	ds_map_add(_map_item_sprite, ITEM.POWER_SPEED_RUN, spr_reliquia_activacio_1);	  // de moment la reliquia


	// === WEAPONS: attack points and gui sprites
	add_item = function(_item) {
		ds_list_add(_list_items_in_inventory, _item);
		UI.show_item_sprite = global.inventory.sprite_item(_item);

	}
	
	
	function weapon_equip(_item) {

		// si primer no el te, el mostra 
		var _cal_mostrar= false;

		switch(_item) {
			case WEAPON.NOTHING:
				current_weapon = _item;
				attack_points = 0;
				current_weapon_sprite = -1;
				current_weapon_sprite_LPC = -1;
				stun_time = 0;
				break;
			case WEAPON.GLOVES:
				_cal_mostrar = _te_gloves == false;
				_te_gloves = true;
				current_weapon =  _item;
				attack_points = 0.5;
				current_weapon_sprite = spr_gloves_gui;
				current_weapon_sprite_LPC = spr_hands_metal_gloves_male;
				stun_time = 10;
				break;
			case WEAPON.DAGA:
				_cal_mostrar = _te_daga == false;
				_te_daga = true;
				current_weapon =  _item;
				attack_points = 1;
				current_weapon_sprite = spr_daga_gui;
				current_weapon_sprite_LPC = spr_weapon_right_hand_male_dagger;
				stun_time = 40;
				break;
			case WEAPON.SWORD:
				_cal_mostrar = _te_sword == false;
				_te_sword = true;
				current_weapon = -1;
				attack_points = 1.5;
				current_weapon_sprite = spr_sword_gui;
				current_weapon_sprite_LPC = spr_weapon_right_hand_male_dagger;  // canviar per espasa <---
				stun_time = 50;
				break;
		}
		
		if _cal_mostrar && global.iUI != -1        // per si equipa algo abans de començar
			global.iUI.show_item_sprite = current_weapon_sprite;
			
	}
	
	

	
	has = function(_item) {
			switch(_item) {
			case WEAPON.GLOVES:
				return _te_gloves;
				break;
			case WEAPON.DAGA:
				return _te_daga;
				break;
			case WEAPON.SWORD:
				return _te_sword;
				break;				
			default:
				show_debug_message("Error en inventori>has");
		}
	
	}

	// === ITEMS

	// afegeix item a la llista d'items
	// si l'item te sprite l'envia a UI per a que el presenti en pantalla com conseguit
	add_item = function(_item) {
		ds_list_add(_list_items_in_inventory, _item);
		if global.iUI != -1   
			if _map_item_sprite[? _item] != -1
				global.iUI.show_item_sprite = _map_item_sprite[? _item];

	}
	
	has_item = function(_item) {
		return ds_list_find_index(_list_items_in_inventory, _item) != -1;
	}
	
	// torna el sprite de l'item o -1
	
	sprite_item = function (_item) {
		if has_item(_item)
			return _map_item_sprite[? _item];   // si es undefinided es que no esta al map
		else
			return -1;
	}
	
	// === DEAD ENEMIES
	add_dead = function(_id) {
		ds_list_add(_list_dead_enemies, _id);
	}
	is_dead = function (_id) {
		return ds_list_find_index(_list_dead_enemies, _id) != -1;
	}
	
	
}
