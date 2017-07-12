state_gravity_direction = 1;
// 1 - gravity to the floor
// 2 - gravity to the ceiling
// 3 - gravity to the left side
// 4 - gravity to the right side
state_movement = 0;
// 0 - no move
// 1 - move
state_rest = 0;
// 0 - no run
// 1 - run
// 2 - rest after run
num_gravity = 1;
// 0 - 0 gravity change time
// 1 - 1 gravity change time

state_jump = 0;
// 0 - no jump
// 1 - jump

//num_jump = 2;  // no use
//// 0 - no jump
//// 1 - 1 times to jump
//// 2 - 2 times to jump
state_jump_move = 0;
// 0 - jump and move
// 1 - jump not move
state_jump_rise_fall = 0;
// 1 - rise
// 0 - ground
// -1 - fall

state_stand = 1;
// 0 - squat
// 1 - stand

state_dash = 0;
// 0 - no dash
// 1 - dash
num_dash = 1;
// 0 - 0 dash time
// 1 - 1 dash time

state_face_sprite = 0;  //for sprite
// 0 - none o
// 1 - up
// 2 - down
// 3 - left
// 4 - right

state_attack = 0;
// 0 - no attack
// 1 - attack ready
// 2 - attack
// 3 - after attack

state_milk = 0;
// 0 - can milk
// 1 - milking
// 2 - milk cold down

pausable = 1; //This object can be paused.

pause = 0;
// 0 - no pause
// 1 - pause

//value
value_hp = 3;
value_hp_max = 3;

value_sp = 100;
value_sp_max = 100;
value_sp_spend_per_second = 40;
//default sp += 20/s
value_sp_increase_per_second = 50;
//default sp -= 20/s

value_kg = 10;

state_live= 1
// 1 - live
// 0 - dead