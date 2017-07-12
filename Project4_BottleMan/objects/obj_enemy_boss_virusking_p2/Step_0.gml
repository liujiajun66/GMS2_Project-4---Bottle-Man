if image_index >= image_number - 1
{
	image_index = image_number - 1
	instance_create_depth(x,y,150,obj_enemy_boss_virusking_p3);
	instance_destroy();
}