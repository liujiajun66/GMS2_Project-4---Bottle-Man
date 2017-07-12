pausable = 1; //This object can be paused.
gravity = 0.03;
gravity_direction = 270;

if obj_player.state_face_sprite == 1
{
	vspeed = -1 + obj_player.vspeed * 10;
}
if obj_player.state_face_sprite == 2
{
	vspeed = 1 + obj_player.vspeed * 10;
}
if obj_player.state_face_sprite == 3
{
	hspeed = -1 + obj_player.hspeed * 10;
}
if obj_player.state_face_sprite == 4
{
	hspeed = 1 + obj_player.hspeed * 10;
}