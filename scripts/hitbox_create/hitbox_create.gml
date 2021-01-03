
function hitbox_create(_sprite, _xscal, _yscal, _xoff, _yoff, _hitbox_life, _attack_points, _stun_time){

_hitbox = instance_create_layer(x+_xoff, y +_yoff, "Instances", obj_hitbox);
_hitbox.sprite_index = _sprite;
_hitbox.owner = id;
_hitbox.image_xscale = _xscal;
_hitbox.image_yscale = _yscal;
//_hitbox.xOffset = _xoff;
//_hitbox.yOffset = _yoff;
_hitbox.life = ( _hitbox_life= -1 ? -999 : _hitbox_life);
_hitbox.attack_points = _attack_points;
_hitbox.stun_time= _stun_time;    // frames entre que pegues i tornes a pegar (pex si tires el braça endarrera)
return _hitbox;
}
