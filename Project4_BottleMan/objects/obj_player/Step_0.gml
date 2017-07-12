if ( obj_pause_controller.pause == 1 ) exit;

//var
var COE = 0.5;
var speed_move = 0.75 * COE;
var speed_move_up_COE = 1.5;
var speed_move_max = 7.5 * COE;
var speed_move_min = 1 * COE;
var speed_move_friction = 0.9;

var speed_jump = 21 * COE;
var speed_dash = 35 * COE;
var speed_gravity = 0.8 * COE;
var speed_attack = speed_jump;
var speed_attack_over_jump_COE = 2;

var temp;

//var collision
var cll = 24;
var sx = (x-sprite_width/2)
var sy = (y-sprite_height/2)
var collision_line_up = collision_line(sx+cll,sy,sx+sprite_width-cll-1,sy,obj_block,0,0);																	
var collision_line_down = collision_line(sx+cll,sy+sprite_height-1,sx+sprite_width-cll-1,sy+sprite_height-1,obj_block,0,0);																	
var collision_line_left = collision_line(sx,sy+cll,sx,sy+sprite_height-cll-1,obj_block,0,0);																	
var collision_line_right = collision_line(sx+sprite_width-1,sy+cll,sx+sprite_width-1,sy+sprite_height-cll-1,obj_block,0,0);																	
var collision_line_up_with_speed = collision_line(sx+cll,sy+vspeed,sx+sprite_width-cll-1,sy+vspeed,obj_block,0,0);																	
var collision_line_down_with_speed = collision_line(sx+cll,sy+vspeed+sprite_height-1,sx+sprite_width-cll-1,sy+vspeed+sprite_height-1,obj_block,0,0);																	
var collision_line_left_with_speed = collision_line(sx+hspeed,sy+cll,sx+hspeed,sy+sprite_height-cll-1,obj_block,0,0);																	
var collision_line_right_with_speed = collision_line(sx+hspeed+sprite_width-1,sy+cll,sx+hspeed+sprite_width-1,sy+sprite_height-cll-1,obj_block,0,0);																	


//live or dead
if state_live = 1
{
	//sp
	if ((value_sp < value_sp_max && !keyboard_check(ord("Z"))) || (value_sp < value_sp_max && state_rest = 2)) && state_jump == 0
	{
		value_sp += value_sp_increase_per_second/room_speed;
		if value_sp > value_sp_max - 1
		{
			value_sp = value_sp_max;
		}
	}
	if value_sp < 1 && state_rest != 2
	{
		state_rest = 2;
		alarm_set(1,room_speed * (value_sp_max/value_sp_increase_per_second) )
	}

	//ground && fall
	if state_gravity_direction == 1
	{
		if state_jump == 0
		{
			temp = collision_line_down;
			if !temp
			{
				state_jump = 1;
				gravity = speed_gravity;
			}
		}
		if state_jump == 1 && 180 < direction < 360 && state_attack != 2
		{
			state_movement = 1;
			temp = collision_line_down_with_speed;
			if temp
			{
				state_jump = 0;
				num_gravity = 1;
				gravity = 0;
				vspeed = 0;
				y = temp.y - (temp.sprite_height/2 + sprite_height/2) + 1;
				state_attack = 0;
			}
		}
		if state_jump == 1 && 180 < direction < 360 && state_attack = 2
		{
			temp = collision_line_down_with_speed;
			if temp
			{
				room_speed = 15;
				alarm_set(2,room_speed * 1)
				num_gravity = 1;
				vspeed = -vspeed * speed_attack_over_jump_COE;
				state_attack = 3;
			}
		}
	}
	if state_gravity_direction == 2
	{
		if state_jump == 0
		{
			temp = collision_line_up;
			if !temp
			{
				state_jump = 1;
				gravity = speed_gravity;
			}
		}
		if state_jump == 1 && 0 < direction < 180 && state_attack != 2
		{
			state_movement = 1;
			temp = collision_line_up_with_speed;
			if temp
			{
				state_jump = 0;
				num_gravity = 1;
				gravity = 0;
				vspeed = 0;
				y = temp.y + (temp.sprite_height/2 + sprite_height/2) - 1;
				state_attack = 0;
			}
		}
		if state_jump == 1 && 0 < direction < 180 && state_attack = 2
		{
			temp = collision_line_up_with_speed;
			if temp
			{
				room_speed = 15;
				alarm_set(2,room_speed * 1)
				num_gravity = 1;
				vspeed = -vspeed * speed_attack_over_jump_COE;
				state_attack = 3;
			}
		}
	}
	if state_gravity_direction == 3
	{
		if state_jump == 0
		{
			temp = collision_line_left;
			if !temp
			{
				state_jump = 1;
				gravity = speed_gravity;
			}
		}
		if state_jump == 1 && 90 < direction < 270 && state_attack != 2
		{
			state_movement = 1;
			temp = collision_line_left_with_speed;
			if temp
			{
				state_jump = 0;
				num_gravity = 1;
				gravity = 0;
				hspeed = 0;
				x = temp.x + (temp.sprite_width/2 + sprite_width/2) - 1;
				state_attack = 0;
			}
		}
		if state_jump == 1 && 90 < direction < 270 && state_attack = 2
		{
			temp = collision_line_left_with_speed;
			if temp
			{
				room_speed = 15;
				alarm_set(2,room_speed * 1)
				num_gravity = 1;
				hspeed = -hspeed * speed_attack_over_jump_COE;
				state_attack = 3;
			}
		}
	}
	if state_gravity_direction == 4
	{
		if state_jump == 0
		{
			temp = collision_line_right;
			if !temp
			{
				state_jump = 1;
				gravity = speed_gravity;
			}
		}
		if state_jump == 1 && (0 <= direction < 90 || 270 < direction < 360) && state_attack != 2
		{
			state_movement = 1;
			temp = collision_line_right_with_speed;
			if temp
			{
				state_jump = 0;
				num_gravity = 1;
				gravity = 0;
				hspeed = 0;
				x = temp.x - (temp.sprite_width/2 + sprite_width/2) + 1;
				state_attack = 0;
			}
		}
		if state_jump == 1 && (0 <= direction < 90 || 270 < direction < 360) && state_attack = 2
		{
			temp = collision_line_right_with_speed;
			if temp
			{
				room_speed = 15;
				alarm_set(2,room_speed * 1)
				num_gravity = 1;
				hspeed = -hspeed * speed_attack_over_jump_COE;
				state_attack = 3;
			}
		}
	}

	//movement
	if state_milk == 0
	{
		if state_gravity_direction == 1 || state_gravity_direction == 2
		{
			if keyboard_check(vk_left)
			{
				state_face_sprite = 3;
				state_movement = 1;
				if keyboard_check(ord("Z")) && state_jump == 0 && value_sp > 0 && (state_rest == 1 || state_rest == 0)
				{
					value_sp -= value_sp_spend_per_second/room_speed;
					state_rest = 1;
					hspeed += -speed_move * speed_move_up_COE;
					if hspeed <= -speed_move_max * speed_move_up_COE
					{
						hspeed = -speed_move_max * speed_move_up_COE;
					}
				}
				else if keyboard_check(ord("Z")) && state_jump == 1 && hspeed <= -speed_move_max
				{
					//empty
				}
				else 
				{
					hspeed += -speed_move;
					if hspeed <= -speed_move_max
					{
						hspeed = -speed_move_max;
					}
				}
			}
			else if keyboard_check(vk_right)
			{
				state_face_sprite = 4;
				state_movement = 1;
				if keyboard_check(ord("Z")) && state_jump == 0 && value_sp > 0 && (state_rest == 1 || state_rest == 0)
				{
					value_sp -= value_sp_spend_per_second/room_speed;
					state_rest = 1;
					hspeed += speed_move * speed_move_up_COE;
					if hspeed >= speed_move_max * speed_move_up_COE
					{
						hspeed = speed_move_max * speed_move_up_COE;
					}
				}
				else if keyboard_check(ord("Z")) && state_jump == 1 && hspeed >= speed_move_max
				{
					//empty
				}
				else
				{
					hspeed += speed_move;
					if hspeed >= speed_move_max
					{
						hspeed = speed_move_max;
					}
				}
			}
			else
			{
				hspeed = hspeed * speed_move_friction;
				if hspeed > -speed_move_min && hspeed < speed_move_min
				{
					hspeed = 0;
					if state_jump == 0
					{
					state_movement = 0;
					}
				}
			}
		}
		if state_gravity_direction == 3 || state_gravity_direction == 4
		{
			if keyboard_check(vk_up)
			{
				state_face_sprite = 1;
				state_movement = 1;
				if keyboard_check(ord("Z")) && state_jump == 0 && value_sp > 0 && (state_rest == 1 || state_rest == 0)
				{
					value_sp -= value_sp_spend_per_second/room_speed;
					state_rest = 1;
					vspeed += -speed_move * speed_move_up_COE;
					if vspeed <= -speed_move_max * speed_move_up_COE
					{
						vspeed = -speed_move_max * speed_move_up_COE;
					}
				}
				else if keyboard_check(ord("Z")) && state_jump == 1 && vspeed <= -speed_move_max
				{
					//empty
				}
				else
				{
					vspeed += -speed_move;
					if vspeed <= -speed_move_max
					{
						vspeed = -speed_move_max;
					}
				}
			}
			else if keyboard_check(vk_down)
			{
				state_face_sprite = 2;
				state_movement = 1;
				if keyboard_check(ord("Z")) && state_jump == 0 && value_sp > 0 && (state_rest == 1 || state_rest == 0)
				{
					value_sp -= value_sp_spend_per_second/room_speed;
					state_rest = 1;
					vspeed += speed_move * speed_move_up_COE;
					if vspeed >= speed_move_max * speed_move_up_COE
					{
						vspeed = speed_move_max * speed_move_up_COE;
					}
				}
				else if keyboard_check(ord("Z")) && state_jump == 1 && vspeed >= speed_move_max
				{
					//empty
				}
				else
				{
					vspeed += speed_move;
					if vspeed >= speed_move_max
					{
						vspeed = speed_move_max;
					}
				}
			}
			else
			{
				vspeed = vspeed * speed_move_friction;
				if vspeed > -speed_move_min && vspeed < speed_move_min
				{
					vspeed = 0;
					if state_jump == 0
					{
					state_movement = 0;
					}
				}
			}
		}
	}
	//gravity direction && state_jump_rise_fall
	if state_gravity_direction == 1
	{
		gravity_direction = 270;
	}
	if state_gravity_direction == 2
	{
		gravity_direction = 90;
	}
	if state_gravity_direction == 3
	{
		gravity_direction = 180;
	}
	if state_gravity_direction == 4
	{
		gravity_direction = 0;
	}

	//jump limit
	if state_jump == 1
	{
		if state_gravity_direction == 1
		{
			if vspeed < 0 && 0 < direction < 180
			{
				temp = collision_line_up_with_speed;
				if temp
				{
					vspeed = 0;
					y = temp.y + (temp.sprite_height/2 + sprite_height/2) + 1;
				}
			}
		}
		if state_gravity_direction == 2
		{
			if vspeed > 0 && 180 < direction < 360
			{
				temp = collision_line_down_with_speed;
				if temp
				{
					vspeed = 0;
					y = temp.y - (temp.sprite_height/2 + sprite_height/2) - 1;
				}
			}
		}
		if state_gravity_direction == 3
		{
			if hspeed > 0 && (0 < direction < 90 || 270 < direction < 360)
			{
				temp = collision_line_right_with_speed;
				if temp
				{
					hspeed = 0;
					x = temp.x - (temp.sprite_width/2 + sprite_width/2) - 1;
				}
			}
		}
		if state_gravity_direction == 4
		{
			if hspeed < 0 && 90 < direction < 270
			{
				temp = collision_line_left_with_speed;
				if temp
				{
					hspeed = 0;
					x = temp.x + (temp.sprite_width/2 + sprite_width/2) + 1;
				}
			}
		}
	}

	//move limit
	if state_gravity_direction == 1 || state_gravity_direction == 2
	{
		if hspeed <= 0 && 90 <= direction <= 270
		{
			temp = collision_line_left_with_speed;
			if temp
			{
			hspeed = 0;
			x = temp.x + (temp.sprite_width/2 + sprite_width/2) - 1;
			}
		}
		if hspeed >= 0 && (0 <= direction <= 90 || 270 <= direction <= 360)
		{
			temp = collision_line_right_with_speed;
			if temp
			{
			hspeed = 0;
			x = temp.x - (temp.sprite_width/2 + sprite_width/2) + 1;
			}
		}
	}
	if state_gravity_direction == 3 || state_gravity_direction == 4
	{
		if vspeed <= 0 && 0 <= direction <= 180
		{
			temp = collision_line_up_with_speed;
			if temp
			{
			vspeed = 0;
			y = temp.y + (temp.sprite_height/2 + sprite_height/2) - 1;
			}
		}
		if vspeed >= 0 && 180 <= direction <= 360
		{
			temp = collision_line_down_with_speed;
			if temp
			{
			vspeed = 0;
			y = temp.y - (temp.sprite_height/2 + sprite_height/2) + 1;
			}
		}
	}

	//jump
	if keyboard_check_pressed(vk_space) && state_jump == 0 && pause == 0
	{
		state_movement = 1;
		state_jump = 1;
		gravity = speed_gravity;
		if state_gravity_direction == 1
		{
		vspeed = -speed_jump;
		}
		if state_gravity_direction == 2
		{
		vspeed = speed_jump;
		}
		if state_gravity_direction == 3
		{
		hspeed = speed_jump;
		}
		if state_gravity_direction == 4
		{
		hspeed = -speed_jump;
		}
	}
	if state_jump == 1  //small jump
		{
		if !keyboard_check(vk_space)
		{
			if (vspeed < 0 && state_gravity_direction == 1) || (vspeed > 0 && state_gravity_direction == 2)
			{
				vspeed /= 1.5;
			}
			if (hspeed < 0 && state_gravity_direction == 4) || (hspeed > 0 && state_gravity_direction == 3)
			{
				hspeed /= 1.5;
			}
		}
	}
	if state_jump == 1  //fall fly
	{
		if keyboard_check(vk_space) && value_sp > 0 && (state_rest == 1 || state_rest == 0)
		{
		state_rest = 1;
		value_sp -= value_sp_spend_per_second/room_speed/2;
			if state_gravity_direction == 1 && vspeed > 0
			{
				gravity = 0;
				vspeed = 2;
			}
			if state_gravity_direction == 2 && vspeed < 0
			{
				gravity = 0;
				vspeed = -2;
			}
			if state_gravity_direction == 3 && hspeed < 0
			{
				gravity = 0;
				hspeed = -2;
			}
			if state_gravity_direction == 4 && hspeed > 0
			{
				gravity = 0;
				hspeed = 2;
			}		
		}
		else
		gravity = speed_gravity;
	}
	//attack
	if state_jump == 1
	{
		if (state_gravity_direction == 1 && keyboard_check(vk_down) && keyboard_check(ord("C"))) || (state_gravity_direction == 2 && keyboard_check(vk_up) && keyboard_check(ord("C"))) || (state_gravity_direction == 3 && keyboard_check(vk_left) && keyboard_check(ord("C"))) || (state_gravity_direction == 4 && keyboard_check(vk_right) && keyboard_check(ord("C")))
		{
			state_attack = 1;
		}
		if (vspeed > speed_attack && state_gravity_direction == 1 && state_attack = 1) || (vspeed < -speed_attack && state_gravity_direction == 2 && state_attack = 1) || (hspeed < -speed_attack && state_gravity_direction == 3 && state_attack = 1) || (hspeed > speed_attack && state_gravity_direction == 4 && state_attack = 1)
		{
			state_attack = 2;
		}
	}

	//milk attack
	if state_jump == 0 && keyboard_check_pressed(ord("C")) && state_milk == 0
	{
		hspeed = 0.1 * hspeed;
		vspeed = 0.1 * vspeed;
		state_milk = 1;
		alarm_set(3,room_speed * 0.54)
		if state_gravity_direction == 1
		{
			if state_face_sprite == 3
			{
				instance_create_depth(x-32,y-16,150,obj_milk);
			}
			if state_face_sprite == 4
			{
				instance_create_depth(x+32,y-16,150,obj_milk);
			}
		}
		if state_gravity_direction == 2
		{
			if state_face_sprite == 3
			{
				instance_create_depth(x-32,y+16,150,obj_milk);
			}
			if state_face_sprite == 4
			{
				instance_create_depth(x+32,y+16,150,obj_milk);
			}
		}
		if state_gravity_direction == 3
		{
			if state_face_sprite == 1
			{
				instance_create_depth(x+16,y-32,150,obj_milk)
			}
			if state_face_sprite == 2
			{
				instance_create_depth(x+16,y+32,150,obj_milk)
			}
		}
		if state_gravity_direction == 4
		{
			if state_face_sprite == 1
			{
				instance_create_depth(x-16,y-32,150,obj_milk)
			}
			if state_face_sprite == 2
			{
				instance_create_depth(x-16,y+32,150,obj_milk)
			}
		}
	}

	//sprite_image use

	if state_gravity_direction == 1
	{
		if state_movement == 1 && state_jump == 1 && state_attack == 0
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_jump_gdfl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_jump_gdfr;
			}
		}
		if state_milk == 1
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_milk_gdfl;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_milk_gdfr;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
		}
		if state_movement == 1 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_walk_gdfl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_walk_gdfr;
			}
		}
		if state_movement == 0 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_stand_gdfl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_stand_gdfr;
			}
		}
		if state_movement == 1 && state_jump == 1 && ( state_attack == 1 || state_attack == 3 )
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_jump_attack_ready_gdfl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_jump_attack_ready_gdfr;
			}
		}
		if state_movement == 1 && state_jump == 1 && state_attack == 2
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_jump_attack_gdfl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_jump_attack_gdfr;
			}
		}
	}
	if state_gravity_direction == 2
	{
		if state_movement == 1 && state_jump == 1 && state_attack == 0
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_jump_gufl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_jump_gufr;
			}
		}
		if state_milk == 1
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_milk_gufl;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_milk_gufr;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
		}
		if state_movement == 1 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_walk_gufl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_walk_gufr;
			}
		}
		if state_movement == 0 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_stand_gufl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_stand_gufr;
			}
		}
		if state_movement == 1 && state_jump == 1 && ( state_attack == 1 || state_attack == 3 )
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_jump_attack_ready_gufl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_jump_attack_ready_gufr;
			}
		}
		if state_movement == 1 && state_jump == 1 && state_attack == 2
		{
			if state_face_sprite == 3
			{
			sprite_index = spr_player_jump_attack_gufl;
			}
			if state_face_sprite == 4
			{
			sprite_index = spr_player_jump_attack_gufr;
			}
		}
	}
	if state_gravity_direction == 3
	{
		if state_movement == 1 && state_jump == 1 && state_attack == 0
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_jump_glfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_jump_glfd;
			}
		}
		if state_milk == 1
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_milk_glfu;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_milk_glfd;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
		}
		if state_movement == 1 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_walk_glfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_walk_glfd;
			}
		}
		if state_movement == 0 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_stand_glfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_stand_glfd;
			}
		}
		if state_movement == 1 && state_jump == 1 && ( state_attack == 1 || state_attack == 3 )
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_jump_attack_ready_glfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_jump_attack_ready_glfd;
			}
		}
		if state_movement == 1 && state_jump == 1 && state_attack == 2
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_jump_attack_glfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_jump_attack_glfd;
			}
		}
	}
	if state_gravity_direction == 4
	{
		if state_movement == 1 && state_jump == 1 && state_attack == 0
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_jump_grfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_jump_grfd;
			}
		}
		if state_milk == 1
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_milk_grfu;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_milk_grfd;
				if image_index >= image_number - 1
				{
					image_index = image_number - 1
				}
			}
		}
		if state_movement == 1 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_walk_grfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_walk_grfd;
			}
		}
		if state_movement == 0 && state_jump == 0 && state_attack == 0 && state_milk == 0 
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_stand_grfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_stand_grfd;
			}
		}
		if state_movement == 1 && state_jump == 1 && ( state_attack == 1 || state_attack == 3 )
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_jump_attack_ready_grfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_jump_attack_ready_grfd;
			}
		}
		if state_movement == 1 && state_jump == 1 && state_attack == 2
		{
			if state_face_sprite == 1
			{
			sprite_index = spr_player_jump_attack_grfu;
			}
			if state_face_sprite == 2
			{
			sprite_index = spr_player_jump_attack_grfd;
			}
		}
	}
	//dash //no use now
	//if keyboard_check_pressed(ord("Z")) && state_dash == 0 && num_dash == 1
	//{
	//	state_dash = 1;
	//	num_dash = num_dash - 1;
	//	alarm_set(0,room_speed * 0.1)
	//	if state_gravity_direction == 1 || state_gravity_direction == 2
	//	{
	//		vspeed = 0;
	//		if state_face_sprite = 3
	//		{
	//			hspeed = -speed_dash;
	//		}
	//		if state_face_sprite = 4
	//		{
	//			hspeed = speed_dash;
	//		}
	//	}
	//	if state_gravity_direction == 3 || state_gravity_direction == 4
	//	{
	//		hspeed = 0;
	//		if state_face_sprite = 1
	//		{
	//			vspeed = -speed_dash;
	//		}
	//		if state_face_sprite = 2
	//		{
	//			vspeed = speed_dash;
	//		}
	//	}
	//}
	}
	if value_hp <= 0 && state_live == 1
	{
		state_live = 0;
		instance_create_layer(800,400,"Instances",obj_word_dead)
		alarm_set(11,room_speed * 3)
		gravity = 0;
		vspeed = 0;
		hspeed = 0;
		image_speed = 0;
}