/// @description Insert description here
// You can write your code in this editor
var key_right = keyboard_check(vk_right);
var key_left = keyboard_check(vk_left);
var key_down = keyboard_check(vk_down);

var key_jump = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_up);
var key_glide = keyboard_check(ord("W"));
var key_dash = keyboard_check_pressed(ord("A"));

var key_strafe = keyboard_check(ord("Q"));

var key_melee = keyboard_check_pressed(ord("D"));
var key_range = keyboard_check_pressed(ord("E"));
 
//slopeOn = keyboard_check(vk_control);

//
dashDuration = max(dashDuration - 1, 0);
nextDashDuration = max(nextDashDuration - 1, 0);
firingDelay = max(firingDelay - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);

iFrames = max(iFrames - 1, 0);

 
//Work out where to move horizontally
hsp = (key_right - key_left) * hspWalk;
 
//Work out where to move vertically
vsp = vsp + grv;


	#region key checks
	
if(key_left) && (!key_strafe) && (state != "dash") {

	image_xscale = -1;
	
} else if(key_right) && (!key_strafe) && (state != "dash") {
	image_xscale = 1;
} 

	
switch (state) 
{
	case "move":
		#region moving
		
		hspWalk = 8;
		sprite_index = sPlayer;
	
	
		if(key_jump){
			if (jumps > 0) && (key_jump){
				image_index = 0;
				sprite_index = Slime_Jump_Test;
				audio_play_sound(Sn_Jump, 3, false);
			
				vsp = vspJump;

				jumps--;
			}
			
			state = "jump";
		}
	
		if (key_range) && (firingDelay <= 0) && (dashDuration <= 0) {
	
		firingDelay = 25;

			with (instance_create_layer(x,y, "Bullets", oBullet)){
		
					speed = 10;

					if (other.image_xscale >= 1) {
						direction = 1;
		
					} else {
						direction = -180;
			
					}

			}
		
		}
	

		if(key_down) {
			audio_play_sound(Sn_Stretch, 3, false);
			image_index = 0;
			state = "puddle";
		}
	
		
		if(key_dash) {
			state = "dash";
		}
	
		
		if(key_melee) {
			image_index = 0;
			state = "melee";
		}
		
		#endregion
		
	break;


	case "jump":	
		#region jumping
	
		if (jumps > 0) && (key_jump){
			image_index = 0;
			sprite_index = Slime_Jump_Test;
			audio_play_sound(Sn_Jump, 3, false);
			
			vsp = vspJump;

			jumps--;
		} else if (key_dash) {
			image_index = 0;
		
			state = "dash";
	
		} else if (key_melee)  {
			image_index = 0;
			audio_play_sound(Sn_Punch, 3, false);
			state = "melee";
		
		} else if (key_range) && (firingDelay <= 0) && (dashDuration <= 0) {
	
		firingDelay = 30;

			with (instance_create_layer(x,y, "Bullets", oBullet)){
		
					speed = 10;

					if (other.image_xscale >= 1) {
						direction = 1;
		
					} else {
						direction = -180;
			
						}

			}
		
		}
	
	#endregion
	
	break;


	case "dash":
		#region dashing
	
		if (canDash > 0) && (nextDashDuration <= 0) {

			dashDuration = 25;
			nextDashDuration = 70;
	
			audio_play_sound(Sn_Dash, 3, false);
			hsp = image_xscale * dashSpeed;
	
			canDash--;

		}

		if (dashDuration > 0) {
			sprite_index = sPlayerGlide;
	
			hsp = image_xscale * dashSpeed;
			vsp = 0;
		} else { 
	
			canDash = dashMax;
			state = "move"
		}
	
	#endregion
	
	break;


	case "melee":
		#region attacking
	
		sprite_index = sPlayerMelee;
	
		ds_list_clear(hitByAttack);
	
		mask_index = sPlayerMeleeHB;
		var hitByAttackNow = ds_list_create();
		var hits = instance_place_list(x, y, oEnemy1, hitByAttackNow, false);
	
		if (hits > 0) {
			for (var i = 0; i < hits; i++) {
			
				var hitID = hitByAttackNow[| i]; //ds_list_find_value(hitByAttackNow, i);
			
				if (ds_list_find_index(hitByAttack, hitID) == -1) {
				
					ds_list_add(hitByAttack, hitID);
			
					with (hitID) {
						if (iFramesE <= 0) {
							audio_play_sound(Sn_Slash, 5, false);
							
							if (oPlayer.x < x) {
								knockback = -10;
							} else {
								knockback = 10;
							}
							
							knockbackDuration = 4;
							state = "knockback";
							
							iFramesE = 12;
							hp--;
							flash = 3;
						}
					}
				}
		
			}
	
		}
	
		ds_list_destroy(hitByAttackNow);
		mask_index = sPlayer;
	
	#endregion
	
	break;


	case "puddle":
		#region down
	
		sprite_index = sPlayerPuddle;
		hspWalk = 4;

		if (image_index >= 12) && (key_down){

			image_speed = 0;
		
		} else {
		
			image_speed = 1;
	
		}
	
	#endregion
		
	break;
	
	case "knockback":
		#region knockback

			if (knockbackDuration > 0){
					hsp -= knockback * 2;
					y -= 25;
				
			} else {
		
				state = "move";
			}
		#endregion
		
	break;
	
	default:
		show_debug_message("State error");
		state = "move";
}
/*
if (key_glide) && (!place_meeting(x,y+1,oWall)) {

	grv = 0.15;
	hspWalk = 7;

	sprite_index = sPlayerGlide;
	
	jumps = 0;

} else {

	hspWalk = 8;
	grv = grvOG;
}
*/


#endregion



	#region collission


if(place_meeting(x,y+1,oWall)) || (place_meeting(x,y+1,oWater)){
	
	jumps = jumpsMax;
	
}

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


if(place_meeting(x, y+vsp, oWall)) {

	while(!place_meeting(x,y+sign(vsp),oWall)) {
	
		y = y + sign(vsp);
	
	}

	vsp = 0;

}

x = x + hsp;


y = y + vsp;




#endregion



	#region outofscreen


if (y >= room_height) || (hp <= 0) {
	
	game_end();

}


#endregion



#region text code abandoned
 /*
 if (canJump-- > 0) && (key_jump)
{
    vsp = vspJump;
    canJump--;
}

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


