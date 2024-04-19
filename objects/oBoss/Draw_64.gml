/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);

draw_text(1060, 30, "Dark Knight - Boss");

draw_set_colour(c_red);

//draw_rectangle(1000, 100, 1000 + (hp * 12), 140, false);

draw_rectangle_color(1000, 100, 1000 + (hp * 12), 140, $0000d9, $20006c, $20006c, $0000d9, false);

draw_set_colour(c_black);

draw_rectangle(1000, 100, 1000 + totalHP, 140, true);