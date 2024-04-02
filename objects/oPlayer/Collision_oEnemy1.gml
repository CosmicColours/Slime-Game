/// @description Insert description here
// You can write your code in this editor

if (state != "dash") and (state != "puddle"){
	if (iFrames <= 0 ) {
		
		audio_play_sound(Sn_Slash, 5, false);
		
		hp--;
		flash = 3;

		if (other.x >= x){
			knockback = 20;
		
		} else {
			knockback = -20;
		}
		knockbackDuration = 4;
		state = "knockback";

		iFrames = 30;
	
	}
}
