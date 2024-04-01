/// @description Insert description here
// You can write your code in this editor

grvOG = 0.5;
grv = 0.5; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hspWalk = 60; //walk speed
vspJump = -500; //jump speed


//canJump = 0; //above zero while we are able to jump
jumps = 0;
jumpsMax = 1;

canDash = 0;
dashMax = 1;

dashSpeed = 15;
dashDuration = 0;
nextDashDuration = 0;


firingDelay = 0;

onGround = false; //are we on the ground?


health = 100;
mana = 10;