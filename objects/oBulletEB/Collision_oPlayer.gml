/// @description Insert description here
// You can write your code in this editor
with (other) {
	
	if (state != "dash"){
		
		if (iFrames <= 0){
			audio_play_sound(Sn_Slash, 5, false);
			
			if (other.x >= x){
				knockback = 10;
		
			} else {
				knockback = -10;
			}
			
			knockbackDuration = 4;
			state = "knockback";
			
		hp--;
		iFrames = 50;
		flash = 8;
		
		other.state = "collide";
		other.speed = 0;
		other.image_index = 0;
		other.sprite_index = BossRangedImpact;
		
		}
	

	}	

}


