/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;

iFramesE = max(iFramesE - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);

	if (knockbackDuration > 0){
		state = "knockback";
	}
	else if (point_distance(oPlayer.x, oPlayer.y, x, y) < 500) {
		image_speed = 1;
		state = "moving";
		
	} else if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1900) {
		image_speed = 0.8;
		state = "range";
	} else {
		hsp = 0;
		sprite_index = BossIdle;
	}

switch (state) 
{

	case "moving":
	#region in sight
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 500) {
		sprite_index = BossWalk;
		
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
	#endregion
	
	break;

	
	case "range":
	
	#region bullet
	
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1900) {
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
		
					speed = random_range(15, 25);

					direction = point_direction(other.x, other.y, oPlayer.x, oPlayer.y) + random_range(-3,3);
				}
		
				countdown = random_range(50, 250);
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
