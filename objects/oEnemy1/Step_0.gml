/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;
sprite_index = sEnemySq;

iFramesE = max(iFramesE - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);



switch (state) 
{

	case "moving":
	#region in sight

	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 600) {
			if (instance_exists(oPlayer)) {
				if (oPlayer.x > x) {

					hsp = 2;
					image_xscale = -1;

				} else {

					hsp = -2;

					image_xscale = 1;
				}
			
		}

	} else if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1000) {
	
			if (instance_exists(oPlayer)) {
				if (oPlayer.x > x) {

					hsp = 0.5;
					image_xscale = -1;

				} else {

					hsp = -0.5;
					image_xscale = 1;
				}
			
			countdown--;
		
			if (countdown <= 0) {
			
				with (instance_create_layer(x,y, "Bullets", oBulletE)){
		
						speed = 5;

						if (oPlayer.x > x) {
							direction = 1;
		
						} else {
							direction = -180;
			
						}

				}
		
				countdown = countDownRate;
			}
	
		}
	}

	#endregion
	
	break;
	
	case "knockback":

		if (knockbackDuration > 0){
			
			hsp -= knockback * 3;
			y -= 15;
				
		} else {
			
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
	
	sprite_index = sEnemySq;
	

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
