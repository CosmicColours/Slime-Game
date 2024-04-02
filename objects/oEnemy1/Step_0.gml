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
		
	} else if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1000) {
		image_speed = 0.8;
		state = "range";
	} else {
		hsp = 0;
		sprite_index = sEnemySq;
	}

switch (state) 
{

	case "moving":
	#region in sight
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 500) {
		sprite_index = SquirrelMoving;
		
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
	
	
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 1000) {
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
				sprite_index = Squirrel_Ranged;
			
				with (instance_create_layer(x,y, "Bullets", oBulletE)){
		
						Speed = 20;
						Gravity = 0.75;
						Resistance = 0.1;
						Direction = point_direction( x, y, oPlayer.x, oPlayer.y);
						HSpeed = dcos( -Direction) * Speed;
						VSpeed = dsin( -Direction) * Speed;

				}
		
				countdown = random_range(100, 200);
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
