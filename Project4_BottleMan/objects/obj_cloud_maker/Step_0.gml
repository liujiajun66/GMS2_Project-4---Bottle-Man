var cloud_depth = 450;
var cloud_num = irandom_range(1,6);
if cloud_rest == 1
{
	
	if cloud_num == 1
	{
		instance_create_depth(-250,irandom_range(64,320),cloud_depth,obj_cloud_1);
	}
	if cloud_num == 2
	{
		instance_create_depth(-250,irandom_range(64,320),cloud_depth,obj_cloud_2);
	}
	if cloud_num == 3
	{
		instance_create_depth(-250,irandom_range(64,320),cloud_depth,obj_cloud_3);
	}
	if cloud_num == 4
	{
		instance_create_depth(-250,irandom_range(64,320),cloud_depth,obj_cloud_4);
	}
	if cloud_num == 5
	{
		instance_create_depth(-250,irandom_range(64,320),cloud_depth,obj_cloud_5);
	}	
	if cloud_num == 6
	{
		instance_create_depth(-250,irandom_range(64,320),cloud_depth,obj_cloud_6);
	}
	alarm_set(0,room_speed * irandom_range(2,8))
	cloud_rest = 0
}