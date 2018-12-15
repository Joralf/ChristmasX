/// @description Insert description here
// You can write your code in this editor

move = -1;
/// Movement
hsp = move * walksp;
vsp = vsp + grv;

// Horizontal Collision
if (place_meeting(x + hsp, y, objWall))
{
	while (!place_meeting(x + sign(hsp), y, objWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;


// Vertical Collision
if (place_meeting(x, y + vsp, objWall))
{
	while (!place_meeting(x, y + sign(vsp), objWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Animation



if (hsp == 0) 
{
	sprite_index = sZombie;
	image_speed = 0;
	image_index = 0;
} 
else
{
	sprite_index = sZombieWalk;
	image_speed = 1;
}


if (hsp != 0) image_xscale= sign(hsp);