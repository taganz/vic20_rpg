/// @desc Draw UI

var _y = 0;
var _scale = 1;


// === Debug warning

_y = 0;
draw_set_colour(c_blue);
draw_set_font(fTextDebug);
draw_text(UI_width/2,0, "DEBUG MODE");

// === HEALTH  sprite 14 * 4

_y = 8;
_scale = 4;


var _playerHealth = global.player_health;				// salut
var _playerHealthMax = global.player_health_max;			// salut maxima (5)
var _playerHealthFrac = frac(_playerHealth);			
_playerHealth -= _playerHealthFrac;						// treiem la part decimal de la salut

// pinta els N cors amb estat diferent segons salut

for (var i = 1; i <= _playerHealthMax; i++)				// per cada cor de salud maxima
{
	var _imageIndex = (i > _playerHealth);				
	if (i == _playerHealth+1)							// si cor i no esta sencer
	{
		_imageIndex += (_playerHealthFrac > 0);			// imatges sprite:   100%  0%  25%  50% 75% 
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5);
	}
	//draw_sprite(spr_health,_imageIndex,8 + ((i-1) * 16), 8);	// pinta cor N
	draw_sprite_ext(spr_health,_imageIndex,8 + ((i-1) * 16*_scale), 8, _scale, _scale, 0, c_white, 0.75);	// pinta cor N
	
}

// === EQUIPED WEAPON - sprite 32 

_y = 60;
_scale = 2;

if (global.inventory.current_weapon != WEAPON.NOTHING) {
	draw_sprite_ext(global.inventory.current_weapon_sprite, 0, 
		8, _y, _scale, _scale, 0, c_white, 0.75);	
}

// === RELIQUIES

_y = 120;
_scale = 3;

if (global.inventory.has_item(ITEM.RELIQUIA_1)) 
	draw_sprite_ext(global.inventory.sprite_item(ITEM.RELIQUIA_1), 0, 
		8, _y, _scale, _scale, 0, c_white, 0.75);	


// === SHOW ITEM


// si hi ha item per mostrar

if show_item_sprite != -1 {
	
	// si es el primer cop activa l'alarma d'apagat
	if show_item_active == false {
		alarm[0]=room_speed * show_item_time;
		show_item_active = true;
		show_item_scale = 0;
		show_item_frame = 0;
		// cal executar el numero de imatges del sprite en els frames que tenim
		show_item_frame_increment = sprite_get_number(show_item_sprite) / show_item_time / room_speed; 
	}
	show_item_scale += show_item_scale_increment; 
	// mostra sprite 
	
	// sprites normals
	if sprite_get_width(show_item_sprite) > 100 { // per exemple les transformacions de reliquies {
		_scale = 1;
	}
	else {
		_scale = 5 * clamp(show_item_scale*5, 0, 2);   // de 0 a 2 creix i despres les altres 4 parts ja ho fa a tope
	}

	
	_y = UI_height/4 - sprite_get_height(show_item_sprite)/2;
	var _x = UI_width/2 - sprite_get_width(show_item_sprite)*_scale/2;

	
	draw_sprite_ext(show_item_sprite, show_item_frame, _x, _y, _scale, _scale, 0, c_white, 1);
	show_item_frame += show_item_frame_increment;
			
}

// === DEBUG   

_y = 130;

if (global.debug) {
	draw_text(0, _y+0, "Camara: "+string(x) + "," +string(y));
	draw_text(0, _y+64, "Room: "+room_get_name(room));
	draw_text(0, _y+128, "Mouse: "+string(round(mouse_x))+", "+string(round(mouse_y)));

}