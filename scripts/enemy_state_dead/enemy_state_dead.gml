// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_dead(){

	// marquem que estem morts per no reespawnejar si tornem a la room
	global.inventory.add_dead(id);
	
	instance_change(oCorpse32,true);
	
	if (enemy_dead_dialogue != -1)
		dialogue(enemy_dead_dialogue);

}