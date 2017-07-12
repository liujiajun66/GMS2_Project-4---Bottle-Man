//for the bug of through wall
var temp;
temp = collision_line(x,y,xprevious,yprevious,obj_block,1,0)
if state_gravity_direction = 1
{
	if temp
	{
		move_contact_all(direction,speed);
		x = xprevious;
		y = yprevious - sprite_height/2;
	}
}
if state_gravity_direction = 2
{
	if temp
	{
		move_contact_all(direction,speed);
		x = xprevious;
		y = yprevious + temp.sprite_height/2;
	}
}
if state_gravity_direction = 3 
{
	if temp
	{
		move_contact_all(direction,speed);
		x = xprevious + temp.sprite_width/2;
		y = yprevious;
	}
}
if state_gravity_direction = 4
{
	if temp
	{
		move_contact_all(direction,speed);
		x = xprevious - temp.sprite_height/2;
		y = yprevious;
	}
}
