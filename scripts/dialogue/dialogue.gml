/// @arg dialogue

/*
// l'inici del dialeg (acabats en zero) es crida en obj_player
// les respostes es criden en origenInstance des de TextBox

 TROUBLESHOOTING --> 
			OJO AMB ELS DOS PUNTS DESPRES DELS NUMEROS DE LES RESPOSTES
			OJO AMB LES COMES QUE PUGUIN QUEDAR ENTRE DUES LINIES DE STRINGS SEPARADES PER UN "+"


// HAURIA DE FER CLASE DIALOGUE I POSAR TEXTBOX ETC AQUI <----

*/

// backgrounds
// 0 - help/sistema
// 1 - narrador
// 2 - personatges

 #macro TALK_SYSTEM 0
 #macro TALK_SPEAKER 1
 #macro TALK_NPC 2
 


function dialogue(argument0) {

	switch(argument0)
	{
		case 0: break;
		case 1: TextBox("Para atacar necesitas un arma", TALK_SYSTEM); break;
		case 2: TextBox(TEXT_HELP, 0); break;
		
		// initial help
		case 10: 
				if (game.initial_help_shown == false) {
					TextBox("Despiertas en una habitación pequeña."
							+"\nNo recuerdas que pasó la noche anterior."
							+"\nParece una celda.", 1);
					TextBox(TEXT_INITIAL_HELP,0); 
					game.initial_help_shown = true;  // nomes es mostra un cop
				}
				break;

		// chest - letter
		case 20: 
				TextBox("Dentro del cofre hay un mensaje:\nLa extraccion sera esta noche, mantenedlo vigilado.", 1);
				break;
		
		// 30 - troba la daga 
		case 30: 
			// si no tiene daga se la ofrece
			if (global.inventory.has(WEAPON.DAGA)== false) {
					TextBox("Has encontrado una daga!", 1, ["31:Guai, trae pa ca!", "32:No la quiero"]); break;
			}
			else {
				TextBox("Esta vacio", 1);
			}
			break;
		case 31: 
			TextBox("Equipas la daga", 1);
			global.inventory.weapon_equip(WEAPON.DAGA);
			break;
		case 32: TextBox ("Aqui estara la proxima vez.\nSi no la roba nadie...", 1); break

		
		// cat
		case 40: TextBox("Hola Victor, t'agraden els gats?", 2, ["41:Molt!", "42:No perque es mengen els hamstsers"]); break;
		case 41: TextBox("Molt be, veig que serem amics", 2); break;
		case 42: TextBox("Els hamsters son fastigosos", 2); break;
		
		// chest - consell per sortir de la cella
		case 50: TextBox("Ya casi tengo el tunel acabado.\nEsta vez los guardias no lo van a descubrir", 1); break;
		
				
		// chest - SWORD
		case 60: 
			if (global.inventory.te_sword == false) 
				 TextBox("Has encontrado una espada!", 1, ["31:Me mola la espada!", "32:No la quiero"]);
			else TextBox("Esta vacio", 1); break;
		case 61: 
			TextBox("Equipas la espada", 1);
			global.inventory.weapon_equip(WEAPON.SWORD);
			break;
		case 62: TextBox ("Aqui estara la proxima vez.\nSi no la roba nadie...", 1); break

		// 70 - troba els guants de combat i els equipa
		
		case 70: 
			if (global.inventory.has(WEAPON.GLOVES) == false) {
					TextBox("Has encontrado unos guantes de combate!", 1); 
					TextBox("Equipas los guantes de combate.\n"+TEXT_COMO_ATACAR, 1);
					global.inventory.weapon_equip(WEAPON.GLOVES);
			}
			else {
				TextBox("Esta vacio", 1);
			}
			break;
				

		// === NPCS CENTRE
		
		// 100 - missatge per defecte NPCs
		
		case 100: TextBox("Hola!", TALK_NPC); break;

		// 110 - Tabernero del centre. Envia player al centro. Da daga
		
		case 110: 
		
				// abans de conseguir reliquia 1
				
				if global.inventory.has_item(ITEM.RELIQUIA_1)==false {
		
					TextBox("Hola yo te conozco, eres el joven Vic. \n¡Has conseguido escapar!", TALK_NPC); 
					TextBox("Mordor ha invadido nuestras tierras. Han capturado dos regiones."
							+"\nHay una que resiste pero están preparando el ataque final."
							+"\nTenemos que impedirlo", TALK_NPC, ["111:¿Que podemos hacer para evitarlo?", "199:Adiós"]); 
				}
				else {
					
					// despres de conseguir la reliquia 1
					
					TextBox("Vic, ¡has conseguido la primera reliquia!"
							+"\nAhora tendrás que esperar a que acaben el siguiente nivel..."
							, TALK_NPC, ["199:Estaré esperando..."]); 
				}
				break;
				
				// explica que la reliquia esta al sud
				
		case 111: TextBox("He oido que buscan las RELIQUIAS MÁGICAS para preparar el ataque."
						 +"\nSi las capturan estamos perdidos. Tenemos que encontrarlas antes."
						 , TALK_NPC, ["112:¿Dónde están escondidas", "199:Adiós"]); 
				  break;
		case 112: TextBox("Se que hay TRES reliquias escondidas en algún lugar."
						 +"\nSólo saben donde los MONJES GUERREROS que las protegen"
						 +"\nPero he visto una patrulla partiendo al sur. Debe haber algo allí"
						 , TALK_NPC, ["113:Voy a ir a investigar. ", "199:Adiós"]); 
				  break;
				  
				  // li dona la daga
				  
		case 113: 
					if (global.inventory.has(WEAPON.DAGA) == false) {
						TextBox("Toma esta daga."
								+"\nVigila, estarán buscándote. ¡Suerte!", TALK_NPC, ["199:¡Gracias!"]);
						global.inventory.weapon_equip(WEAPON.DAGA);
					}
					else
						TextBox("Vigila, estarán buscándote. ¡Suerte!", TALK_NPC, ["1919:¡Hasta pronto!"]);
						break;
		case 199: break;
		




		// === SIGN POSTS

		// sign posts
		case 210: TextBox("Hola, on et penses que estas?", 0, ["211:Al chiquipark", "212:A la preso"]);break;
		case 211: TextBox("Pringat!", 0); break;
		case 212: TextBox("Si! I com penses sortir?", 0); break;		
		//
		case 220: TextBox("Apreta ENTER despres de llegir els missatges", 0);break;
		case 230: TextBox("Aquest gat esta boig", 0);break;
		case 240: TextBox("Mata els esquelets amb SPACE", 0);break;
		
		
		// === NPCS DESERT
		
		// 320 - monjo del sud explica on esta la reliquia 1 i despres com s'obte el poder
		
		case 310: 
		
				// abans de trobar reliquia
				
				if global.inventory.has_item(ITEM.RELIQUIA_1)==false {
				  TextBox("Hola, soy Alden, el Monje Guerrero del Sur.\nTu eres Vic20. Me alegro de verte.", TALK_NPC, ["311:¿Cómo sabes quien soy?", "319:Adiós"]); break;
				}
				
				// despres ded trobar reliquia
				
				else {
				  TextBox("Vic, ¡has conseguido la reliquia!"
						+"\nVeo que eres tan astuto como tu tío Porter"
						, TALK_SPEAKER, ["316:Sí, ¿como podemos obtener su poder?", "319:Adíos, a ti te lo voy a decir..."]);
				}
				break;

		// antes de reliquia
		case 311: TextBox("Tu tío Porter pertenecía a nuestra orden. ¿Que haces por aquí?", TALK_NPC, ["312:Estoy buscando las reliquias sagradas", "319:Adiós, solo pasaba por aquí"]); break;
		case 312: TextBox("Gracias a Dios. Mordor ha enviado una patrulla a robar la reliquia."
						+"\nYo estoy viejo para defenderla, aunque si la encuentran no podrán usarla."
						, TALK_NPC, ["313:¿Por qué?", "319:Adiós, (este abuelo chochea)"]);break;
		case 313: TextBox("Porque necesitan SANGRE MÁGICA para obtener su poder."
						, TALK_NPC, ["314:¿Sangre mágica?", "319:Adiós, (querrán hacer morcilla sagradas)"]);break;		
		case 314: TextBox("No hay tiempo. Recupera la reliquia y te lo contaré..."
						+"\nEstá escondida en la cueva al este. Espero que no hayan llegado ya los Mordorianos"
						, TALK_NPC, ["319:La recuperaré y volveré", "319:Adiós, paso, esto da mucho miedo"]);break;
						
		// con la reliquia
		case 316: TextBox("Las reliquias necesitan activarse con SANGRE MÁGICA."
						+"\nTu familia la tiene, por eso te encerraron y te iban a extraer sangre."
						+"\nCon una gota de sangre tuya puedes obtener su poder."
						, TALK_NPC, ["317:Pues adelante, me pincho un dedo", "319:Adiós, la sangre me marea"]);break;
		case 317: TextBox("Pongo la gota de sangre sobre la relíquia...", TALK_NPC, ["3171:¡...!"]);
						break;
		case 3171: global.inventory.add_item(ITEM.POWER_SPEED_RUN);
			       TextBox(" ",TALK_NPC,["3172:¡...!"]);
				   break;
		case 3172: TextBox("\n... y se te ha otorgado el poder del SPEED RUN"
						+"\nAhora busca al Monje de la Montaña para buscar la SEGUNDA RELIQUIA"
						, TALK_NPC, ["318:¡Genial! Voy volando..."]);
						break;
		case 318: TextBox(TEXT_COMO_SPEED_RUN, TALK_SPEAKER); break;
		case 319: break;
		
		
		// 330 - entrada a cova reliquia 1
		
		case 330: TextBox("Otro pringado que viene a buscar relíquias."
						+"\nSoy el capitán Rakeln Mylev. Vas a ser mi cuarta víctima hoy"
						, TALK_NPC, ["339:Ya lo veremos", "339:Adiós, yo ya me iba"]);break;
		
		case 339: break;
		
		
		// 340 - mort boss cova reliquia 2
		
		case 340: TextBox("Parece que al capitán Rakeln Mylev se le ha terminado la suerte."
						+"\nBuscas en su armadura y encuentras la RELIQUIA ESMERALDA"
						, TALK_SPEAKER, ["350:Continuar!"]);
				  break;
		case 350:
				global.inventory.add_item(ITEM.RELIQUIA_1);
				break;
						
		
		
		case 359: break;
		
		// === GAME CONTROL
		
		// 910 - player dead. confirm restart
		
		case 900: TextBox("HAS MUERTO", 1);
				  TextBox("¿Quieres reintentar?", 0, ["901:Sí", "902:Salir"]);
				  break;
		case 901: 
				  // si hi ha save room torna al darrer save room amb vida a tope
				  // de la resta no toquem res
				  if game.rooms.last_save_room != -1 {
						game.restart_game_at_save_room = true;
				  }
				  else {
						game_restart(); 
				  } 
				  break;
		case 902: game_end(); break;
		
		// 910 - confirm restart
		
		case 910: TextBox("¿Quieres reiniciar?", 0, ["911:Cancelar", "912:Reiniciar"]);
				  break;
		case 911: break;
		case 912: game_restart(); break;
		
		// 920 - confirm exit
		
		case 920: TextBox("¿Quieres salir?", 0, ["921:Cancelar", "922:Salir"]);
				  break;
		case 921: break;
		case 922: game_end(); break;
		
		default: show_debug_message("*** Error dialogue code: "+string(argument0)); break;
	}


}
