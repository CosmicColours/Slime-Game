/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;
sprite_index = sEnemySq;

iFramesE = max(iFramesE - 1, 0);
knockbackDuration = max(knockbackDuration - 1, 0);


if (knockbackDuration > 0){
			
	hsp -= knockback * 3;
	y -= 15;
				
} else {

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


if (x >= 0) {

	image_xscale = -1;

} else {


	image_xscale = 1;

}