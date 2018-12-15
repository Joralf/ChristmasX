/// @description Player movement and animation


move = 0;
key_jump = 0;
key_shoot = 0;
firing = 0;

if (gamepad_button_check_pressed(0, gp_face4)) game_restart();
if (gamepad_button_check_pressed(0, gp_face1)) key_jump = 1;
if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2) move = gamepad_axis_value(0, gp_axislh)
if (gamepad_button_check_pressed(0, gp_shoulderrb)) key_shoot = 1;

if (firing_delay > 0)
{ 
	var firing = true;
}

if (!firing) 
{
	hsp = move * runsp;
}
else
{
	hsp = 0;
}

vsp = vsp + grv;

firing_delay -= 1
if (key_shoot && firing_delay < 0)
{
	firing_delay = 18;
}

if (firing_delay == 1)
{
	with(instance_create_layer(x, y, "Bullets", objStone))
	{
		speed = 10;
		if (other.image_xscale == 1 )
		{
			direction = 45;
		}
		else
		{
			direction = 135;
		}
	}
}



// Jump
if (place_meeting(x, y + 1, objWall)) && key_jump
{
	vsp = - jumpsp;
}


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

if (!place_meeting(x, y + 1, objWall))
{
	sprite_index = sPlayerJump;
	image_speed = 1;
	if (image_index == 9) image_speed = 0;
}
else 
{
	if (firing)
	{
		sprite_index = sPlayerThrow;
		image_speed = 1;
		if (image_index == 9) image_speed = 0;
	}
	else if (hsp == 0) 
	{
		sprite_index = sPlayer;
		image_speed = 0;
		image_index = 0;
	} 
	else
	{
		if (abs(hsp) > walksp)
		{
			sprite_index = sPlayerRun;
			image_speed = 1;
		}
		else
		{
			sprite_index = sPlayerWalk;
			image_speed = 1;
		}


	}
}

if (hsp != 0) image_xscale= sign(hsp);