/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (entityShadow) draw_sprite(sShadow,0,floor(x),floor(y));


if (flash != 0)
{
	shader_set(shWhiteFlash);
	shader_set_uniform_f(uFlash, flash);
}

draw_sprite_LPC_sheet(1);


if (shader_current() != -1) shader_reset();