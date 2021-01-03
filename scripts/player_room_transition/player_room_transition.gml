
/*

	Si detecta colision con obj_transition marca doTransition para que game lo ejecute
	
	out:
		- doTransition 
		- spawnRoom, spawnX, spawnY, spawn_player_direction_after
		
		
		<---- s'hauria de fer una classe amb l'objecte Rooms_Setup i aixo.... 
		<--- no se perque tinc rooms al game i no al player


*/

function player_room_transition(){

	// --- ROOM TRANSITION
	
	var inst_transition = instance_place(x,y,obj_transitions);
	var _facing_direction = round(direction/90)*90;
	if (inst_transition != noone and (_facing_direction == inst_transition.player_direction_entering or inst_transition.player_direction_entering==-1)) {
		with (game) {
			if (!doTransition) {
				spawnRoom = inst_transition.targetRoom;
				spawnX = (inst_transition.targetX == -1 ? obj_player.x : inst_transition.targetX );
				spawnY = (inst_transition.targetY == -1 ? obj_player.y : inst_transition.targetY );;
				spawn_player_direction_after = inst_transition.player_direction_after;
				doTransition = true;
			}
		}
	}
	
	// NOU SISTEMA DESEMBRE 2020
	
	else {
		inst_transition = instance_place(x,y,obj_transitions_nou);
		var _facing_direction = round(direction/90)*90;
		if (inst_transition != noone and (_facing_direction == inst_transition.player_direction_entering or inst_transition.player_direction_entering==-1)) {
			with (game) {
				if (!doTransition) {
					
					var _entry = game.rooms.get_entry(inst_transition.targetRoom, inst_transition.targetEntryCode);
					spawnRoom = inst_transition.targetRoom;
					spawnX = (_entry.x == -1 ? obj_player.x : _entry.x);
					spawnY = (_entry.y == -1 ? obj_player.y : _entry.y);;
					spawn_player_direction_after = _entry.player_direction_after;
					doTransition = true;
				}
			}
		}
	}
}