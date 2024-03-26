/// @description Insert description here
// You can write your code in this editor

grv = 0.7; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hspWalk = 6; //walk speed
vspJump = -20; //jump speed


canJump = 0; //above zero while we are able to jump
jumpsMax = 1;

canDash = 0;
dashMax = 1;

dashSpeed = 15;
dashDuration = 0;
nextDashDuration = 0;

onGround = false; //are we on the ground?

health = 100;
mana = 10;