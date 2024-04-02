/// @description Insert description here
// You can write your code in this editor

if (state == "melee") {

	state = "move";
}

if (state == "puddle") {
	
	puddleDuration = 50;
	state = "move";

}

if (state == "jump") {
	state = "move";
	
}