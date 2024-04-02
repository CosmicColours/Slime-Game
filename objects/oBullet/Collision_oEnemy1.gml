/// @description Insert description here
// You can write your code in this editor

if (state == "moving") {

	state = "collide";
	speed = 0;
	image_index = 0;
	sprite_index = Slime_Bullet_Impact;
	
	with (other) {
	
		audio_play_sound(Sn_Slash, 5, false);

				if (other.x < x) {
					knockback = -3;
				} else {
					knockback = 3;
				}
							
				knockbackDuration = 4;
				
		hp--;
		iFramesE = 20;
		flash = 3;

	}
}
