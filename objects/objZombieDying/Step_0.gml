/// @description Insert description here
// You can write your code in this editor


/// Movement
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

// Stop animation when died

if (image_index == 6) 
{
	image_speed = 0;
	hsp = 0;
}