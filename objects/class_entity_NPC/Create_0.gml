/// @description assign LPC sprites


event_inherited();

spr_LPC_base   = NPC_LPC_base;
spr_LPC_hair   = NPC_LPC_hair;
spr_LPC_torso  = NPC_LPC_torso;
spr_LPC_legs   = NPC_LPC_legs;
spr_LPC_feet   = NPC_LPC_feet;
spr_LPC_weapon = NPC_LPC_weapon;

spr_shadow	= sShadow;

frame_size = 64;
sprite_state = SPRITE.IDLE;
previous_sprite_state = SPRITE.IDLE;
x_frame = 0;

direction = 270;
