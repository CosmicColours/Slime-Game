/// @description Insert description here
// You can write your code in this editor
	
with (other) {

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
		
		}
		

}

speed = speed / 3;
image_index = 0;
sprite_index = Slime_Bullet_Impact;
state = "collide"

