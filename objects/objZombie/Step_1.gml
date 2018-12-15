/// @description Insert description here
// You can write your code in this editor

if hp <= 0
{
	with(instance_create_layer(x, y, layer, objZombieDying)) 
	{
		hsp = sign(other.hitfrom) * 1;
		if other.hitstrength > 1 vsp = other.hitstrength;
	}
	instance_destroy();
	
}




