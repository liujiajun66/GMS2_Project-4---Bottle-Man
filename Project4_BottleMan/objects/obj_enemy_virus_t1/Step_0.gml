if state_rain = 0
{
	instance_create_depth(x,y,150,obj_enemy_virus_t1_05);
	state_rain = 1;
	alarm_set(0,room_speed * 2);
}