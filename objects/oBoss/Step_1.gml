/// @description Insert description here
// You can write your code in this editor

if (hp <= 0) {

	instance_destroy();
	
	var _sequence = Sequence1;
	var _layerName = "End";
	
	layer_sequence_create(_layerName, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), _sequence);
	
//	game_end();
}
