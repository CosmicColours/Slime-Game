/// @description Insert description here
// You can write your code in this editor

draw_set_font(Test);

draw_set_colour(#ffffff);

draw_text(50, 50, "Health");

draw_text(260, 50, "Mana");

draw_text(450, 50, "Mana Recovery");


draw_text(50, 100, hp);

draw_rectangle_color(50, 100, 50 + (hp * 8), 150, $1200a1, $5c00d9, $5c00d9, $1200a1, false);

//draw_text(250, 100, mana);


draw_rectangle_color(260, 100, 260 + (mana * 12), 150, $00a862, $34cac1, $34cac1, $00a862, false);

//draw_text(400, 100, manaRecover);


draw_rectangle_color(450, 100, 450 + manaRecover, 150, c_teal, $c79921, $c79921, c_teal, false);


draw_set_colour(c_black);

draw_rectangle(50, 100, 50 + totalHP, 150, true);

draw_rectangle(260, 100, 260 + totalMana, 150, true);

draw_rectangle(450, 100, 601, 150, true);

