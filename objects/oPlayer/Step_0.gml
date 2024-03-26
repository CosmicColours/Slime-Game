/// @description Insert description here
// You can write your code in this editor
var key_right = keyboard_check(vk_right);
//var key_up = keyboard_check(vk_up);
var key_left = keyboard_check(vk_left);
var key_down = keyboard_check(vk_down);

var key_jump = keyboard_check_pressed(ord("S"));
var key_glide = keyboard_check(ord("D"));
var key_dash = keyboard_check_pressed(ord("A"));
 
//slopeOn = keyboard_check(vk_control);

sprite_index = sPlayer;

//
dashDuration = max(dashDuration - 1, 0);

 
//Work out where to move horizontally
hsp = (key_right - key_left) * hspWalk;
 
//Work out where to move vertically
vsp = vsp + grv;
 
//Work out if we should jump
if (canJump-- > 0) && (key_jump)
{
    vsp = vspJump;
    canJump--;
}
 
#region new collission 
 /*
//Are we on the ground?
onGround = place_meeting(x,y+1,oWall);
 
 
//Horizontal move & collide
var _hCol = move_and_collide(hsp, 0, oWall, abs(hsp))

if (_keyLeft) {
	image_xscale = -1;

} else if (_keyRight){
	image_xscale = 1;
}
 
//Walk down slope
if (onGround) && (place_meeting(x,y + abs(hsp) + 1 ,oWall)) && (vsp >= 0)
{   
    vsp += abs(hsp) + 1;
}
 
//Vertical move & collide
var _vCol = move_and_collide(0, vsp, oWall, abs(vsp)+1 , hsp, vsp, hsp, vsp)

if (array_length(_vCol)  > 0)
{
    if (vsp > 0) canJump = 22;
    vsp = 0;
}


if (place_meeting(x,y, oWater)) {

	sprite_index = sPlayerHurt;
	

}

if (x >= room_width) || (x <= 0) || (y >= room_height) || (health <= 0) {
	
	game_end();

}

*/


#endregion


#region old code


#region key checks

if (key_dash) {

	dashDuration = 15;
	hsp = image_xscale * dashSpeed;

}

if (dashDuration > 0) {
	sprite_index = sPlayerGlide;
		hsp = image_xscale * dashSpeed;
	vsp = 0;
}


if (key_glide) && (!place_meeting(x,y+1,oWall)) {

	grv = 0.15;
	hspWalk = 7;

	sprite_index = sPlayerGlide;
	
	jumps = 0;

} else {

	hspWalk = 6;
	grv = 0.7;
}


if (key_down) {

	sprite_index = sPlayerGlide;
}


if(key_left) {

	image_xscale = -1;
	
}

if(key_right) {
	image_xscale = 1;
}


if(key_jump) && (jumps > 0) && (!key_glide){
	
		vsp = -12;

		jumps--;

}


if(place_meeting(x,y+1,oWall)) || (place_meeting(x,y+1,oWater)){
	
	jumps = jumpsMax;

}

#endregion


#region collission

if (place_meeting(x,y, oWater)) {

	sprite_index = sPlayerHurt;
	
	health--;
	

}

if(place_meeting(x+hsp, y, oWall)) {

	while(!place_meeting(x+sign(hsp),y,oWall)) {
	
		x = x + sign(hsp);
	
	}
	
	hsp = 0;
	

}



x = x + hsp;


if(place_meeting(x, y+vsp, oWall)) {

	while(!place_meeting(x,y+sign(vsp),oWall)) {
	
		y = y + sign(vsp);
	
	}

	vsp = 0;

}


y = y + vsp;




#endregion


#region outofscreen


if (y >= room_height) || (health <= 0) {
	
	game_end();

}


#endregion



#endregion