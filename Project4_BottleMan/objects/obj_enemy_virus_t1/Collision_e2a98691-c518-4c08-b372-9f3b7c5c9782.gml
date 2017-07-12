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