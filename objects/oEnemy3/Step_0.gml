/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;

iFramesE = max(iFramesE - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);

	if (knockbackDuration > 0){
		state = "knockback";
		audio_stop_sound(Skeleton_BoneNoises);		

	}
	else if (point_distance(oPlayer.x, oPlayer.y, x, y) < 300) {
		image_speed = 1;
		state = "moving";
		
	} else if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1200) {
		image_speed = 0.8;
		audio_stop_sound(Skeleton_BoneNoises);
		state = "range";
	} else {
		hsp = 0;
		audio_stop_sound(Skeleton_BoneNoises);
		sprite_index = SkeletonMagicIdle;
	}

switch (state) 
{

	case "moving":
	#region in sight
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 300) {
		sprite_index = SkeletonMagicWalk;
		
		if (instance_exists(oPlayer)) {
			
			if(audio_is_playing(Skeleton_BoneNoises) == false) {
		
				audio_play_sound(Skeleton_BoneNoises, 10, false);

			}

				 if (oPlayer.x >= x) {

					hsp = 3;
					image_xscale = -1;

				} else {

					hsp = -3;

					image_xscale = 1;
				}
			
		}

}
	#endregion
	
	break;

	
	case "range":
	
	#region bullet
	
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1200) {
		
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
				sprite_index = SkeletonMagicAttack;
			
				with (instance_create_layer(x,y, "Bullets", oBulletEM)){
					
					audio_play_sound(choose(Mage_SpellShooting_01, Mage_SpellShooting_02), 7, false);
		
					speed = 15;

					if (oPlayer.x < x) {
						direction = -180;
		
					} else {
						direction = 0;
			
					}

				}
		
				countdown = random_range(50, 200);
			}
	
		}
}	
	#endregion
	
	break;
	
	case "knockback":
			
			hsp -= knockback * 3;
			y -= 15;
				
	
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
