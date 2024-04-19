/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;

iFramesE = max(iFramesE - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);

distanceToUs = point_distance(oPlayer.x, oPlayer.y, x, y);

	if (knockbackDuration > 0){
		state = "knockback";
	}


switch (state) 
{

	case "moving":
	#region in sight
	
	if (distanceToUs <= 900) && (distanceToUs > 300) {
		sprite_index = BossWalk;
		
		if (instance_exists(oPlayer)) {

				 if (oPlayer.x >= x) {

					hsp = 4;
					image_xscale = -1;

				} else {

					hsp = -4;

					image_xscale = 1;
				}
			
		} 
	}
		else if (distanceToUs > 900) {

			image_speed = 1;
			sprite_index = BossIdle;
			state = "range";
			
			
		} 
		else if (distanceToUs <= 300) {
		
			image_speed = 0.7;
			image_index = 0;
			
			hsp = 0;
			state = "attack";
	} 
		else {
		hsp = 0;
		sprite_index = BossIdle;
	}


	#endregion
	
	break;

	
	case "range":
	
	#region bullet
	
	
	if (distanceToUs > 900) {
			if (instance_exists(oPlayer)) {
				
				if (oPlayer.x > x) {

					hsp = 0;
					image_xscale = -1;

				} else {

					hsp = 0;
					image_xscale = 1;
				}
			
			countdown--;
		
			if (countdown <= 0) {
				image_index = 0;
				sprite_index = BossRange;
				
			
				with (instance_create_layer(x,y, "Bullets", oBulletEB)){
		
					speed = random_range(15, 30);

					direction = point_direction(other.x, other.y, oPlayer.x, oPlayer.y) + random_range(-3,3);
				}
		
				countdown = random_range(50, 150);
			}
	
		}
	} 
	else if (distanceToUs <= 300) {
		
			image_speed = 0.8;
			image_index = 0;
			state = "attack";
	} 
	else if (distanceToUs <= 900) && (distanceToUs > 300) {
			image_speed = 1;
			state = "moving";
	}
	
	#endregion
	
	break;
	
		case "attack":
	#region attack
	 if (distanceToUs <= 1900) && (distanceToUs > 800) {

			image_speed = 1;
			state = "range";
			
			
		} 	else if (distanceToUs <= 800) && (distanceToUs > 450) {
			image_speed = 1;
			state = "moving";
	}		
						
		if (oPlayer.x > x) {

			image_xscale = -1;

		} else {

			image_xscale = 1;
		}
	
		sprite_index = BossMelee;
		mask_index = BossMeleeHB;
		image_speed = 0.7;

		if (instance_place(x, y, oPlayer)) {
			with (oPlayer) {
				if (iFrames <= 0) {
					audio_play_sound(Sn_Slash, 5, false);
							
							if (other.x < x) {
								oPlayer.knockback = -10;
							} else {
								oPlayer.knockback = 10;
							}
							
							oPlayer.knockbackDuration = 5;
							oPlayer.state = "knockback";
							
							oPlayer.iFrames = 50;
							oPlayer.hp -= 4;
							oPlayer.flash = 5;
						}
					}
					
		}

	
	mask_index = BossMelee;
	

	
	break;

	#endregion
	
	
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
