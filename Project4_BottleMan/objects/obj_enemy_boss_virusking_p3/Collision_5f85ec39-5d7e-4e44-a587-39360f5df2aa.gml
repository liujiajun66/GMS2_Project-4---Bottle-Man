if state_flash = 0
{
	state_flash = 1;
	if obj_player.state_jump == 1
	{
		obj_player.vspeed = 2;
	}
	if obj_player.state_jump == 0
	{
		obj_player.vspeed = 0;
	}
	obj_player.hspeed = -obj_player.hspeed * 2;
	obj_player.value_hp -= 1;
	alarm_set(2,room_speed * 3)
}
