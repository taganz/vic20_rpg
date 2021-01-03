/*
	in
		- hSpeed, vSpeed
		- spr_walk, spr_idle
	out
		- localFrame
		- animationEnd

*/

function draw_sprite_tira_NWSE(){


	// === Select sprite - Update Sprite Index
	
	var _oldSprite = sprite_index;
	if (hSpeed!= 0 || vSpeed)
	{
		sprite_index = spr_walk;
	} else sprite_index = spr_idle;
	if (_oldSprite != sprite_index) localFrame = 0;


	// === Animate sprite - Update image index
	
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + ( (round(direction/90)-1) * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	//If animation would loop on next game step
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;	
		localFrame -= _totalFrames;
	}else animationEnd = false;


	// === Draw
	
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y-z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)



}

