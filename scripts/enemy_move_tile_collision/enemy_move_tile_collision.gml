/*

	mou controlant si hi tile collision
	- presuposa que els tiles de colision tenen TILE_COLLISION_SIZE
	
	in: 
		x, y, hspeed, vspeed, collisionMap
	out:
		x, y				-- incrementa segons velocitat i corregeix a inici tile si hi ha col.lisio
		hspeed, vspeed		-- els posa a zero si col.lisiona
		return boolean si hi ha hagut collision

*/

function enemy_move_tile_collision() {
	var _collision = false;
	var _entityList = ds_list_create();  //
	
	
	// === HORIZONTAL
	//Horizontal Tiles
	var _tile = tilemap_get_at_pixel(collisionMap,x + hSpeed,y);
	if (_tile)
	{
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
	_tile = tilemap_get_at_pixel(collisionMap,x,y + vSpeed);
	if (_tile)
	{
		if (global.debug) {
			_tile = tile_set_index(_tile, 2);
			tilemap_set_at_pixel(collisionMap, _tile, x , y + vSpeed);
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
