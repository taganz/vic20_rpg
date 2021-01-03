
/*
   Crea un object hurtbox que es el que detecta els hits als atacks
   in
   - Escalat del sprite, que te un pixel originalment
   - On esta el punt d'offset
   
 */

function hurtbox_create( _xscale, _yscale, _xoff, _yoff){
	if (object_index==obj_player) {
		_hurtbox = instance_create_layer(x,y, "Instances", obj_hurtbox_player);
	}
	else {
		_hurtbox = instance_create_layer(x,y, "Instances", obj_hurtbox);
	}
	_hurtbox.owner = id;
	_hurtbox.image_xscale = _xscale;
	_hurtbox.image_yscale = _yscale;
	_hurtbox.xOffset = _xoff;
	_hurtbox.yOffset = _yoff;
	return _hurtbox;
}