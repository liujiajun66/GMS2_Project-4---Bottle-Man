if obj_player.state_jump == 1
{
	instance_create_depth(x,y,150,obj_milk_big_destroy);
	instance_destroy();
}