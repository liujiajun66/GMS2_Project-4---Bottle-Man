state_fall = 0;
state_move = 0;
instance_create_depth(x+50,y-66,150,obj_enemy_boss_virusking_bomb_p2);
instance_create_depth(x,y-66,150,obj_enemy_boss_virusking_bomb_p2);
instance_create_depth(x-50,y-66,150,obj_enemy_boss_virusking_bomb_p2);
alarm_set(0,room_speed * 1);