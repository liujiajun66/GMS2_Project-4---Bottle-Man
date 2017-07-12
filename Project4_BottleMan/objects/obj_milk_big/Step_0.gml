var speed_move_friction = 0.95;
hspeed = hspeed * speed_move_friction;
vspeed = -1;
if y <= 62
{
	instance_create_depth(x,y,150,obj_milk_big_destroy)
	instance_destroy();
}