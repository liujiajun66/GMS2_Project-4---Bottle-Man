var speedup = 5;

if pause == 0 && obj_player.num_gravity = 1
{
	if keyboard_check_pressed(ord("X")) //Pauses the game when the player press Enter.
	{
		pause = 1; //The game is paused.
		instance_create_layer(room_width/2,room_height/2,"Instances",obj_pause);
		with all //Saves the state of all "pausable" instances and put all their local variable to 0.
		{
			if pausable == 1
			{
				prev_image_speed = image_speed;
				prev_vspeed = vspeed;
				prev_hspeed = hspeed;
				prev_gravity = gravity;
				image_speed = 0;
				vspeed = 0;
				hspeed = 0;
				gravity = 0;
			}
		}
	}
}

if pause == 1
{
	with all  //Maintains all the alarms of "pausable" objects to the same value while the game is paused..
	{
		if pausable == 1
		{
			if (alarm[0]>0) alarm[0]+=1;
			if (alarm[1]>0) alarm[1]+=1;
			if (alarm[2]>0) alarm[2]+=1;
			if (alarm[3]>0) alarm[3]+=1;
			if (alarm[4]>0) alarm[4]+=1;
			if (alarm[5]>0) alarm[5]+=1;
			if (alarm[6]>0) alarm[6]+=1;
			if (alarm[7]>0) alarm[7]+=1;
			if (alarm[8]>0) alarm[8]+=1;
			if (alarm[9]>0) alarm[9]+=1;
			if (alarm[10]>0) alarm[10]+=1;
			if (alarm[11]>0) alarm[11]+=1;
		}
	}
}

//gravity change
if pause == 1
{

	if obj_player.num_gravity >= 1
	{
		if keyboard_check_pressed(vk_up) && obj_player.state_gravity_direction != 2
		{
			obj_player.state_face_sprite = 4;
			obj_player.state_gravity_direction = 2;
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_vspeed = prev_vspeed - speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_up) && obj_player.state_gravity_direction = 2
		{
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_vspeed = prev_vspeed - speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_down) && obj_player.state_gravity_direction != 1
		{
			obj_player.state_face_sprite = 4;
			obj_player.state_gravity_direction = 1;
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_vspeed = prev_vspeed + speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_down) && obj_player.state_gravity_direction = 1
		{
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_vspeed = prev_vspeed + speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_left) && obj_player.state_gravity_direction != 3
		{
			obj_player.state_face_sprite = 1;
			obj_player.state_gravity_direction = 3;
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_hspeed = prev_hspeed - speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_left) && obj_player.state_gravity_direction = 3
		{
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_hspeed = prev_hspeed - speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_right) && obj_player.state_gravity_direction != 4
		{
			obj_player.state_face_sprite = 1;
			obj_player.state_gravity_direction = 4;
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_hspeed = prev_hspeed + speedup;
				}
			}
		}
		if keyboard_check_pressed(vk_right) && obj_player.state_gravity_direction = 4
		{
			obj_player.num_gravity = obj_player.num_gravity - 1;
			pause = 0; //The game resumes.
			with obj_pause instance_destroy(); //Destroys the pause object.
			with all
			{
				if pausable == 1
				{
					image_speed = prev_image_speed;
					vspeed = prev_vspeed;
					hspeed = prev_hspeed;
					gravity = prev_gravity;
				}
			}
			with obj_player
			{
				if pausable == 1
				{
				prev_hspeed = prev_hspeed + speedup;
				}
			}
		}
	}
}