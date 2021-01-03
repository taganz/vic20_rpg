/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


// si te un sprite i abans no el tenia el mostra uns segons a sobre el player
// i despres el treu

show_item_time = 3;  // time in screen for shown item

show_item_sprite = -1;
show_item_active = false;
show_item_scale = -1;
show_item_scale_increment = 1/ (show_item_time*room_speed);   
show_item_frame_increment = -1;


UI_height = window_get_height();
UI_width = window_get_width();