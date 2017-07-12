if obj_player.x > obj_enemy_boss_virusking_p1.x + 20
{
	hspeed = 2.5;
}
if obj_player.x < obj_enemy_boss_virusking_p1.x - 20
{
	hspeed = -2.5;
}
if obj_player.x <= obj_enemy_boss_virusking_p1.x + 20 && obj_player.x >= obj_enemy_boss_virusking_p1.x + 20
{
	hspeed = 0;
}
vspeed = -0.5;
gravity = 0.08;
gravity_direction = 270;
pausable = 1; //This object can be paused.