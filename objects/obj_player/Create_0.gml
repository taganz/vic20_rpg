/// @description


// === STATE

previous_state = -1;
state = -1;
next_state= PLAYERSTATE.FREE;
state_entry = true;
frames_in_state = -1;
// hp esta en global.player_health


// === PERSISTENCIA

if (global.player_initialized == true) {
	// reequip previous weapon
	global.inventory.weapon_equip(global.inventory.current_weapon);
}
global.player_initialized = true;


// === ATTACK SYSTEM

hitByAttack = -1;
//attack_points = -1;   esta a l'inventori
hurtbox = hurtbox_create(32, 48, -16, -48);  // x&y scale, x&y offset
hitbox = -1;
stun_time = -1;  // temps que em quedare empanat si m'ataquen (ho fixa el hitbox atacant)



// === MOVEMENT AND COLLISION

direction = 270;

// VARS SHAUN
image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 72;
distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));


//=== ANIMATION AND SPRITE


// sprite son LPC spritesheets


sprite_state = -1;
previous_sprite_state = -1;
//spr_base = spr_pelverd_tot;    // o -1
LPC_scale = 1;  // factor escalat imatge
spr_LPC_base = spr_base_male_1;

spr_LPC_feet   = spr_feet_male_boots_brown;
spr_LPC_legs   = spr_legs_male_shorts_green;
spr_LPC_torso  = spr_torso_leather_chest_male;
spr_LPC_hair   = spr_hair_male_bedhead_pink;
spr_LPC_weapon   = -1;   //spr_weapon_right_hand_male_dagger


frame_size = 64;	// tamany de cada imatge del stripe
anim_length = -1;	// depen del moviment!
anim_speed = 12;    // increment del frame = anim_speed / room_speed
x_frame = 1;	// primera animacio
y_frame = -1;    // linia de walk down en LPC Sheet

//y_offset_ulls = 32; // com que tenim la x,y abaix aqui poso on estarien els ulls

if (spr_LPC_base != -1) {
	spr_shadow = spr_character_shadow_lts;
	mask_index = spr_character_collision_mask_lts;
}



