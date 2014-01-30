
move_left = 0
move_right = 0
move_jump = 0
move_up = 0
move_down = 0

//MOVE LEFT KEYBOARD MAPPING

if keyboard_check(keyboard_move_left)
    {
    facing = -1;
    if !position_meeting(x-32,y,obj_ground)
        move_left = 1
    }
if keyboard_check(keyboard_move_right)
    {
    facing = 1;
    if !position_meeting(x+32,y,obj_ground)
        move_right = 1
    }
    
if keyboard_check(keyboard_move_jump)
    {
    move_jump = 1
    }
    
if keyboard_check(keyboard_move_up)
    {
    move_up = 1
    }
    
if keyboard_check(keyboard_move_down)
    {
    move_down = 1
    }
    
if(!gamepad_is_connected(1))
    {
    if(gamepad_button_check_pressed(0, gp_face4))
        {
        if(player_id = 0)
            {
            player_id = 1;
            }
        else
            {
            player_id = 0;
            }
        }
    }
if(gamepad_is_connected(player_id))
    {
    if(gamepad_button_check(player_id, gp_face1))
        {
        move_jump =1 ;
        }
    if(gamepad_axis_value(player_id,gp_axislh) < -.4)
        {
        facing= -1;
        if !position_meeting(x-32,y,obj_ground)
            move_left = -(gamepad_axis_value(player_id,gp_axislh))
        }
    
    if(gamepad_axis_value(player_id,gp_axislh) > .4)
        {
        facing =1;
        if !position_meeting(x+32,y,obj_ground)
            move_right = gamepad_axis_value(player_id,gp_axislh)
        }
    if(gamepad_axis_value(player_id, gp_axislv) > .4)
        {
        move_down = 1;
        }
    if(gamepad_axis_value(player_id, gp_axislv) < -.4)
        {
        move_up = 1;
        }
    if(gamepad_button_check_pressed(player_id, gp_shoulderr))
        {
        if(gravity = 1)
            {
            gravity = .1;
            }
        else
            {
            gravity = 1;
            }
        }
    }

//Move left and right

if move_right - move_left != 0
if !ghook_active
    {
    //hspeed = 0
    }

if ghook_active = 0
    {
    x += (move_right - move_left) * max_speed
    }
else
    {
    motion_add(point_direction(x,y,ghook_x,ghook_y)+90,-.4*(move_right - move_left))
    ghook_dis -= (move_up - move_down) * 4
    if ghook_dis < 32 
        ghook_dis = 32
    if ghook_dis > max_ghook_dis
        ghook_dis = max_ghook_dis
    }
//Move jump

if move_jump
    {
    if vspeed = 0
    if collision_circle(x,y+sprite_height/2+3,3,obj_ground,1,1)
    if can_jump
        {
        can_jump = 0
        alarm[1] = 10
        motion_add(90,18)
        }
    if vspeed < 0
        {
        motion_add(90,.2)
        }
        
    if collision_circle(x + facing * sprite_width , y , 3 ,obj_ground,1,1)
    if can_jump
    if jumps = 0
        {
        jumps++
        can_jump = 0
        alarm[1] = 10
        motion_add(0, -14 * facing )
        motion_add(90, 12)
        }
    }

///////////////////
if(gamepad_button_check_pressed(player_id,gp_face3)) || keyboard_check_pressed(keyboard_move_grap)
    {
    //Shoot Grappling Hook
    if !ghook_active
        {
        ghook_active = 1
        ghook_x = x
        ghook_y = y
        ghook_hspd = 20 * facing + hspeed
        //if vspeed != 0
            ghook_vspd = -20 + vspeed
        //else
        //    ghook_vspd = vspeed
        }
    else
        {
        ghook_active = 0
        }
    }
