/// @description Insert description here
// You can write your code in this editor
state = "move";

grvOG = 0.6;
grv = 0.6; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hspWalk = 8; //walk speed
vspJump = -17; //jump speed


//canJump = 0; //above zero while we are able to jump
jumps = 0;
jumpsMax = 1;

canDash = 0;
dashMax = 1;

dashSpeed = 20;
dashDuration = 0;
nextDashDuration = 0;


firingDelay = 0;

onGround = false; //are we on the ground?


health = 100;
mana = 10;