// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MACROS(){
	
// === config DEBUG 
#macro RUN_AS_DEBUG true // <--- SI ESTA TRUE APLIQUEN ELS DE SOTA 

#macro DEBUG_TINC_DAGA true     // comences amb una daga (game>create)
#macro DEBUG_TINC_RELIQUIES false
#macro DEBUG_VIDES_PLAYER 5
#macro DEBUG_VIDES_INFINITES false
#macro DEBUG_ROOM_START rm_centre
// === 



#macro ROOM_START rm_cella
#macro PLAYER_VIDES 3


	
#macro FRAME_RATE 60
#macro TILE_SIZE 32 //16
#macro TILE_COLLISION_SIZE 16


// es fa servir al pintar els textos, tambe al fixar application surface pero ho tinc comentat (29/11/20)
#macro RESOLUTION_W 1500 //320
#macro RESOLUTION_H 820 //180

// 
#macro STD_ROOM_W 800
#macro STD_ROOM_H 600


enum PLAYERSTATE
{
	FREE,
	ATTACK_SLASH,
	ATTACK_COMBO,
	ACTIVATE_ENTITY,
	LOCKED,
	ROLL,
	HURT,
	DIE,
	DEAD
}

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	DEAD,
	PATH,
	WAIT
}

enum SPRITE 
{
	IDLE,
	SPELL,
	THRUST,
	CHASE,
	WALK,
	SLASH,
	SHOOT,
	HURT,
	DIE,
	DEAD
}


enum SPRITEFORMAT
{
	IMATGE,
	TIRA_E,
	TIRA_NWSE,
	LPC_SHEET
}




}