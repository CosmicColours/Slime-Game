/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, oWall)) || (x >= room_width) or (x <= 0) {
	
	if (state == "moving"){
		state = "collide";
		
		audio_play_sound(FinalBoss_FireBallImpact, 5, false);
		
		speed = 0;
		image_index = 0;
		sprite_index = BossRangedImpact;
	}

}