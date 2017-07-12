/// @description for dash //no use now
//var
var coe = 0.5;
var speed_move = 1 * coe;
var speed_move_max = 10 * coe;
var speed_move_min = 1 * coe;
var speed_move_friction = 0.9;

var speed_jump = 22 * coe;
var speed_dash = 35 * coe;
var speed_gravity = 0.8 * coe;
var speed_attack = 15 * coe;

var temp;

num_dash = 1;
state_dash = 0;
if state_gravity_direction == 1 || state_gravity_direction == 2
{
	if state_face_sprite = 3
	{
		hspeed = -speed_move_max;
	}
	if state_face_sprite = 4
	{
		hspeed = speed_move_max;
	}
}
if state_gravity_direction == 3 || state_gravity_direction == 4
{
	if state_face_sprite = 1
	{
		vspeed = -speed_move_max;
	}
	if state_face_sprite = 2
	{
		vspeed = speed_move_max;
	}
}