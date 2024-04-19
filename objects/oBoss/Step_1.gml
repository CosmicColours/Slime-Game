/// @description Insert description here
// You can write your code in this editor

if (hp <= 0) {

	instance_destroy();
	
	var _sequence = Sequence1;
	var _layerName = "End";
	
	audio_stop_all();
	
	audio_play_sound(FinalBoss_Roar, 10, false);
	
	audio_play_sound(VictorySound, 1, false);
	layer_sequence_create(_layerName, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), _sequence);
	
//	game_end();
}
