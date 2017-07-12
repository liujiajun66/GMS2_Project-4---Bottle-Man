if x > obj_player.x + 5 && state_move = 1
{
	hspeed = -4;
}
if x < obj_player.x - 5 && state_move = 1
{
	hspeed = 4;
}
if x >= obj_player.x - 5 && x <= obj_player.x + 5
{
		hspeed = 0;
}
if state_attack = 0
{
	instance_create_depth(x+50,y,150,obj_enemy_boss_virusking_bomb_p1);
	instance_create_depth(x,y,150,obj_enemy_boss_virusking_bomb_p1);
	instance_create_depth(x-50,y,150,obj_enemy_boss_virusking_bomb_p1);
	alarm_set(1,room_speed * 3);
	alarm_set(0,room_speed * 2);
	state_move = 0;
	state_attack = 1;
}
if hp = 0
{
	obj_eth.num_eth += 1500;
	instance_create_depth(x,y,150,obj_enemy_boss_virusking_p2);
	instance_destroy();
}