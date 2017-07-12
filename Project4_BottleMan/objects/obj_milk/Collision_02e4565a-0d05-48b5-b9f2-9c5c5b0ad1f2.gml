if hspeed > 0
{
	instance_create_depth(x+3,y,150,obj_milk_suck_r)
	instance_create_depth(x+3,y,150,obj_milk_big)
}
if hspeed < 0
{
	instance_create_depth(x-3,y,150,obj_milk_suck_l)
	instance_create_depth(x+3,y,150,obj_milk_big)
}
instance_destroy();