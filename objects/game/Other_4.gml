/// @description Room transition, iUI, debut
// You can write your code in this editor



show_debug_message("Entrant a: "+room_get_name(room));

// === layers

if (layer_exists("Col")) layer_set_visible("Col", global.debug);
if (layer_exists("Transitions")) layer_set_visible("Transitions", global.debug);
if (layer_exists("Collider")) layer_set_visible("Collider", global.debug);

if (layer_exists("Col")) {
	var _lay_id = layer_get_id("Col");
	global.col_tile_layer = layer_tilemap_get_id(_lay_id);
}
else {
	show_message("ERROR: NO HI HA LAYER COL EN ROOM "+room.name);
	game_end();
}


// === UI

global.iUI = instance_create_layer(0,0,layer,UI);

if global.debug {
	show_debug_message("rooms="+rooms.to_string(room_get_name(room)));
}


if instance_exists(obj_player)== false
	show_debug_message("**** NO HI HA PLAYER *** "+room_get_name(room));
	

// === transicions

if (spawnRoom != -1) {
		
	obj_player.x = spawnX;
	obj_player.y = spawnY;
	obj_player.direction = spawn_player_direction_after;

}

// === dialogue

var _d = rooms.get_dialogue(room_get_name(room));
if _d != -1
	dialogue(_d);
	
	
	

