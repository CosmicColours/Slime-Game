/// @description Insert description here
// You can write your code in this editor

state = "moving";

Speed = 20;
Gravity = 0.75;
Resistance = 0.1;
Direction = point_direction( x, y, oPlayer.x, oPlayer.y);
HSpeed = dcos( -Direction) * Speed;
VSpeed = dsin( -Direction) * Speed;