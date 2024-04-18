/// @description Insert description here
// You can write your code in this editor

w = camera_get_view_width(view_camera[0]);

h = camera_get_view_height(view_camera[0]);

h_half = h / 2;

enum TRANS_MODE {

	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO

}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;