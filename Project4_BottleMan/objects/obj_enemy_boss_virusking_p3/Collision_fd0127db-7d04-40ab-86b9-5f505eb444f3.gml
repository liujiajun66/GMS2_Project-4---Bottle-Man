if state_flash = 0
{
	hp -= 1;
	state_flash = 1;
	alarm_set(2,room_speed * 3)
}
