/// @description Insert description here
// You can write your code in this editor

if( abs( HSpeed) < Resistance){
    HSpeed = 0;
}else{
    HSpeed -= sign( HSpeed) * Resistance;
}
x += HSpeed;
VSpeed += Gravity;
y += VSpeed - randomH;