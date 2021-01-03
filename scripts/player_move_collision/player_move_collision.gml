
/*
		- Actualitza posicio x,y i posa vSpeed, hSpeed si hi ha collisio amb tiles o entities
		
		- Input: 
			- x, y, vSpeed, hSpeed, collisionMap
		- Output: 
			- x,y, vSpeed, hSpeed
		- return 
			- bool collision;
		

*/

function player_move_collision(){

	var _collision = false;
	var _entityList = ds_list_create();

			
	// === HORIZONTAL
			
	//Horizontal Tiles
	var _tile = tilemap_get_at_pixel(collisionMap,x + hSpeed,y);   // torna el tile data
	if (_tile)
	{
		// marca cella de collisio en blau
		if (global.debug) {
			_tile = tile_set_index(_tile, 2);
			tilemap_set_at_pixel(collisionMap, _tile, x + hSpeed, y); 
		}
		x -= x mod TILE_COLLISION_SIZE;	
		if (sign(hSpeed) == 1) x += TILE_COLLISION_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}

	//Horizontal Entities
	var _entityCount = instance_position_list(x+hSpeed,y,class_entity,_entityList,false);
	var _snapX;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true)
		{
			//Move as close as we can
			if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right+1;
			else _snapX = _entityCheck.bbox_left-1;
			x = _snapX
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entityCount--;
	}

	//Horizontal Move Commit
	x += hSpeed;


	// === VERTICAL
		
	
	//Vertical Tiles
	var _tile = tilemap_get_at_pixel(collisionMap, x ,y + vSpeed);
	if (_tile)
	//if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		if (global.debug) {
			_tile = tile_set_index(_tile, 2);
			tilemap_set_at_pixel(collisionMap, _tile, x, y+ vSpeed);
		}	
			
		y -= y mod TILE_COLLISION_SIZE;	
		if (sign(vSpeed) == 1) y += TILE_COLLISION_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}





	//Vertical Entities
	var _entityCount = instance_position_list(x,y+vSpeed,class_entity,_entityList,false);
	var _snapY;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true)
		{
			//Move as close as we can
			if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom+1;
			else _snapY = _entityCheck.bbox_top-1;
			y = _snapY
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entityCount--;
	}

	//Vertical Move Commit
	y += vSpeed;




	return _collision;
}


