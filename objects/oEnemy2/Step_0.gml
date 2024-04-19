/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;

iFramesE = max(iFramesE - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);



switch (state) 
{

	case "moving":
	#region in sight
	
	if (knockbackDuration > 0){
		state = "knockback";
	}
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 900) && (point_distance(oPlayer.x, oPlayer.y, x, y) > 400) {
		sprite_index = sGoblinWalk;
		
		if (instance_exists(oPlayer)) {

				 if (oPlayer.x >= x) {

					hsp = 3;
					image_xscale = -1;

				} else {

					hsp = -3;

					image_xscale = 1;
				}
			
		} 
	}	
	else if (point_distance(oPlayer.x, oPlayer.y, x, y) <= 400) {
			image_index = 0;

			hsp = 0;
			state = "attack";
		
		} 
		else {
			hsp = 0;
			sprite_index = GoblinIdle;
		}


	#endregion
	
	break;
	
	
	case "attack":
	#region attack
		
		sprite_index = sGoblinAttack;
		
						
		if (oPlayer.x > x) {

			image_xscale = -1;

		} else {

			image_xscale = 1;
		}
	
	
		mask_index = sGobAttackHB;
		image_speed = 0.65;

		if (place_meeting(x, y, oPlayer)) {
			with (oPlayer) {
				if (iFrames <= 0) {
					audio_play_sound(Sn_Slash, 5, false);
							
							if (other.x < x) {
								knockback = -10;
							} else {
								knockback = 10;
							}
							
							knockbackDuration = 8;
							state = "knockback";
							
							iFrames = 50;
							hp -= 1;
							flash = 5;
						}
					}
					
		}

	
	mask_index = GoblinIdle;

	#endregion
	
	break;
	
	case "knockback":
			
			hsp -= knockback * 3;
			y -= 15;
			
			if (knockbackDuration <= 0) {
			
			state = "moving";
			
			}
				
	
	break;
	
	default:
		hsp = 0;
	

}

#region collission


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



#endregion

x = x + hsp;


y = y + vsp;
