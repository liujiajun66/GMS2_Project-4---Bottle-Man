if state_hit == 0
{
	x = obj_player.x;
	y = 384;
}
if state_hit == 1 && state_shack == 0
{
	state_shack = 1;
	alarm_set(0,room_speed * 0.02)
}