/// @description   ...

#macro OFFSET_Y_ACTIVACIO 24    // la mitat del sprite 

function player_state_activate_entity(){

	//1. Check for an entity to activate
	//2. If there is nothing, or there is something, but it has no script - Roll!
	//3. Otherwise, there is something and it has a script! Activate!
	//4. If the thing we activate is an NPC, make it face towards us!
	
	// ==== state entry
	
	if (state_entry == true) {
		//mask_index = spr_character_collision_mask_full;
	}


	// ha de passar un segon almenys per evitar rebots amb el space de tancar missatges
	

	
	// === busca si hi ha una entity aprop
	
	//var _factor_tile = 1;
	//_factor_tile = 2;   // als sprites grossos cal ampliar una mica
	
	//var _activateX = x + lengthdir_x(10, direction) * _factor_tile;
	//var _activateY = y + lengthdir_y(10, direction) * _factor_tile;
	
	var _activateX = x + lengthdir_x(20, direction);
	var _activateY = y - OFFSET_Y_ACTIVACIO +  lengthdir_y(20, direction);
	var _activateSize = 4 
	var _activateList = ds_list_create();
	activate = noone;
	var _entitiesFound = collision_rectangle_list(
			_activateX-_activateSize,
			_activateY-_activateSize*2,
			_activateX+_activateSize,
			_activateY+_activateSize*2,
			class_entity,
			false,
			true,
			_activateList,
			true
		);
		
	
	//If the first instance we find is either our lifted entity or has no script, try the next one.
	while (_entitiesFound > 0)
	{
		var _check = _activateList[| --_entitiesFound];
		if (_check != global.iLifted)  && (_check.entityActivateScript != -1)
		{
			activate = _check;
			break;
		}
	}
	
	ds_list_destroy(_activateList);
	
	
	
	if (activate == noone)
	{

		//Throw something if held, otherwise roll     
		if (global.iLifted != noone)
		{
			Player_Throw();
			next_state = PLAYERSTATE.FREE;
		}
		else
		{
			next_state = PLAYERSTATE.ROLL;  
			moveDistanceRemaining = distanceRoll;   
		};   
	}
	else
	{
		
		// el ActivateScript controlara l'estat
		//next_state = PLAYERSTATE.FREE;    
		
		//Activate the entity
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		
		//Make an npc face the player
		if (activate.entityNPC)
		{
			with (activate)
			{
				direction = point_direction(x,y,other.x,other.y);
				//image_index = CARDINAL_DIR;
			}
		}
		
	}
	
}


