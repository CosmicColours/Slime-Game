/// @description Insert description here
// You can write your code in this editor
state = "move";
hitByAttack = ds_list_create();

enemies = [ oEnemy1, oEnemy2, oEnemy3, oBoss];

grvOG = 0.6;
grv = 0.6; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hspWalk = 10; //walk speed
vspJump = -20; //jump speed


//canJump = 0; //above zero while we are able to jump
jumps = 0;
jumpsMax = 1;

canDash = 1;
dashMax = 1;

dashSpeed = 20;
dashDuration = 0;
nextDashDuration = 0;

knockback = -20;
knockbackDuration = 0;

firingDelay = 0;

manaRecover = 0;
hpRecover = 0;


flash = 0;
iFrames = 0;


hp = 20;
mana = 6;

totalHP = hp * 8;

totalMana = mana * 12;

