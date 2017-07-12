if hp > 0
{
	if x > obj_player.x + 15 && state_move == 1 && state_fall == 0
	{
		hspeed = -7;
	}
	if x < obj_player.x - 15 && state_move == 1 && state_fall == 0
	{
		hspeed = 7;
	}
	if x >= obj_player.x - 15 && x <= obj_player.x + 15 && y <= 256
	{
		state_fall = 1;
		hspeed = 0;
		vspeed = 7;
	}
	if state_fall == 0 && y > 256
	{
		vspeed = -4
	}
	if y <= 256 && state_fall == 0
	{
		y = 256;
		vspeed = 0;
		state_move = 1;
	}
}
if hp <= 0 && state_die_bomb > 0 && state_die_boob_rest = 0
{
	hspeed = 0;
	vspeed = 0;
	instance_create_depth(x+irandom_range(-64,64),y+irandom_range(-64,64),100,obj_virus_boss_destroy);
	instance_create_depth(x+irandom_range(-64,64),y+irandom_range(-64,64),100,obj_virus_boss_destroy);
	instance_create_depth(x+irandom_range(-64,64),y+irandom_range(-64,64),100,obj_virus_boss_destroy);
	instance_create_depth(x+irandom_range(-64,64),y+irandom_range(-64,64),100,obj_virus_boss_destroy);
	state_die_boob_rest = 1;
	alarm_set(1,room_speed * 0.5)
}
if state_die_bomb = 0
{
	obj_eth.num_eth += 2000;
	instance_create_depth(x-40,y,150,obj_bottle_hp_up);
	instance_create_depth(x+40,y,150,obj_bottle_sp_up);
	instance_destroy();
	instance_create_depth(room_width+31,672,150,obj_room_next);
	instance_create_depth(room_width-64,384,150,obj_room0_next);
}