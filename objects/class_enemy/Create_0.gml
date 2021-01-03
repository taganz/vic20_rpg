// ajustos variables
enemy_hurtbox_scale_x *= enemy_image_scale;
enemy_hurtbox_scale_y *= enemy_image_scale;
enemy_hurtbox_offset_x *= enemy_image_scale;
enemy_hurtbox_offset_y *= enemy_image_scale;
enemy_view_eyes_offset *= enemy_image_scale;


// persistencia si l'hem matat
if global.inventory.is_dead(id)
	instance_destroy();
	


// === ATTACK 

stun_time = 0;
hurtbox = hurtbox_create(enemy_hurtbox_scale_x, enemy_hurtbox_scale_y, enemy_hurtbox_offset_x, enemy_hurtbox_offset_y);  // x&y scale, x&y offset
hitbox = -1;

hp = enemy_hp;			// health points
attack_points = enemy_attack_points;
//hitNow = false;
time_since_last_attack = -1;



// === MOVEMENT

direction = enemy_direction;
hSpeed = 0;
vSpeed =0;
xTo = xstart;		// desti per wander
yTo = ystart;
direct = 0;			// ell li diu dir pero ho tinc pillat 
view_angle2 = -1;
idle_time = -1;		
x_init = x;
y_init = y;


// === DRAWING

z = 0;
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash,"flash");

// Hi ha 3 tipus de sprites
//	enemy_spr_es_tira_E
//	enemy_spr_es_LPC_sheet
//	enemy_spr_es_tira_NWSE

switch(enemy_sprite_format){
	case SPRITEFORMAT.IMATGE:
		sprite_index = enemy_spr_idle;
		break;
}
	
frameCount = 0;			// es fa servir en estate hurt, die, ... igual caldria generalitzar a state_frame_count?


// per tires
spr_walk = enemy_spr_walk;
spr_hurt = enemy_spr_hurt;
spr_thrust = enemy_spr_thrust;
spr_slash = enemy_spr_slash;
spr_spell = enemy_spr_spell;
spr_shoot = enemy_spr_shoot;
spr_hurt = enemy_spr_hurt;
spr_idle = enemy_spr_idle;
spr_die = enemy_spr_die;
spr_dead = enemy_spr_dead;
spr_chase = enemy_spr_chase;

// per LPC sheet

frame_size = 64;	// tamany de cada imatge del stripe
anim_speed = 12;    // increment del frame = anim_speed / room_speed
x_frame = 1;	// primera animacio
y_frame = -1;    // linia de walk down en LPC Sheet
LPC_scale = enemy_image_scale;

sprite_state = spr_idle;
previous_sprite_state = -1;
spr_shadow  = -1;
animationEnd = false;

// per NWSE
localFrame = 0;    // ??



// === VIEW  - classe per veure el player

view = new Enemy_View(enemy_view_eyes_offset, enemy_distance_view, enemy_view_angle, enemy_distance_hear);


// == ESTATS

if enemy_path != -1
	next_state=ENEMYSTATE.PATH;
else
	next_state = ENEMYSTATE.IDLE;
previous_state = -1;
state = -1;
state_entry = false;	
timePassed = 0;		// safety check if it gets blocked
path_started = false;		// only starts path once. after that will wander


// Enemy Scripts
enemy_script[ENEMYSTATE.IDLE] = enemy_state_idle;
enemy_script[ENEMYSTATE.WANDER] = enemy_state_wander;
enemy_script[ENEMYSTATE.PATH] = enemy_state_path;
enemy_script[ENEMYSTATE.CHASE] = enemy_state_chase;
enemy_script[ENEMYSTATE.ATTACK] = enemy_state_attack;
enemy_script[ENEMYSTATE.HURT] = enemy_state_hurt;
enemy_script[ENEMYSTATE.DIE] = enemy_state_die;
enemy_script[ENEMYSTATE.DEAD] = enemy_state_dead;
enemy_script[ENEMYSTATE.WAIT] = -1;    //<---???


