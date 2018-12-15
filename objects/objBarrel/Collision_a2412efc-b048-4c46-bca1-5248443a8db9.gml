/// @description Collision With Stone

with(instance_create_layer(x, y, "Bullets", objExplosion))
{
	x = other.x;
	y = other.y;
	instance_destroy(other);
}