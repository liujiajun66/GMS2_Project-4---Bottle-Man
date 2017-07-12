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
instance_create_depth(x,y,150,obj_enemy_virus_t1_destroy_05);
instance_destroy();

