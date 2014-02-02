
//Move left and right walk

if global.move_right[player_id] - global.move_left[player_id] != 0
if !ghook_active
    {
    //hspeed = 0
    }


    
if ghook_active = 0
    {
    off = (global.move_right[player_id] - global.move_left[player_id])
    if !collision_circle(x + off * sprite_width / 3 , y , 3 , obj_ground , 1 , 1)
    //WALK
    x += (global.move_right[player_id] - global.move_left[player_id]) * max_speed
    
    if off > 0 facing = 1 
    if off < 0 facing = -1
    if (global.move_right[player_id] - global.move_left[player_id]) != 0
        {
        if player_id = 0
            sprite_index = spr_mouse_moving
        if player_id = 1
            sprite_index = spr_mouse_moving2
        image_index += abs((global.move_right[player_id] - global.move_left[player_id])) / 3
        }
    else
        {
        if player_id = 0
            sprite_index = spr_mouse
        if player_id = 1
            sprite_index = spr_mouse2
        image_index = 0
        }
    //hspeed += (move_right - global.move_left[player_id])
    }
else
    {
    motion_add(point_direction(x,y,ghook_x,ghook_y)+90,-.4*(global.move_right[player_id] - global.move_left[player_id]))
    ghook_dis -= (global.move_up[player_id] - global.move_down[player_id]) * 4
    if ghook_dis < 32 
        ghook_dis = 32
    if ghook_dis > max_ghook_dis
        ghook_dis = max_ghook_dis
    }
//Move jump

if global.move_jump[player_id]
    {
    if vspeed > 1
    if collision_line(x,y,x,y+sprite_width/2+16,obj_ground,1,1)
        {
        //instance_create(x,y+sprite_width/2,obj_pow)
        }
    //GROUND BOUNCE
    if vspeed = 0
    if collision_circle(x,y+sprite_width/2+3,3,obj_ground,1,1)
    if can_jump
        {
        audio_play_sound(snd_jump,1,0)
        can_jump = 0
        alarm[1] = 10
        motion_add(90,18)
        //motion_add(0,5 * facing)
        }
    if vspeed < 0
        {
        motion_add(90,.2)
        }
    }
if global.move_wall_bounce[player_id]
    {
    //WALL BOUNCE
    if collision_circle(x + facing * sprite_width/2 , y , 3 ,obj_ground,1,1)
    if can_jump
    if jumps = 0
        {
        audio_play_sound(snd_jump,1,0)
        instance_create(x,y,obj_pow)
        jumps++
        can_jump = 0
        alarm[1] = 10
        //motion_add(0, -8 * facing )
        motion_add(90, 16)
        }
    }

///////////////////
if global.action[player_id] //(gamepad_button_check_pressed(controlled,gp_face3)) || keyboard_check_pressed(keyboard_move_grap)
    {
    if vspeed != 0
        {
        //Shoot Grappling Hook
        if !instance_exists(obj_weapon)
            {
            if !ghook_active
                {
                audio_play_sound(snd_ghook,1,0)
                ghook_active = 1
                ghook_x = x
                ghook_y = y
                ghook_hspd = 20 * facing + hspeed
                
                    ghook_vspd = -20 + vspeed
                }
            else
                {
                ghook_active = 0
                }
            }
        }
    else
        {
        if !ghook_active
        if cfire
            {
            audio_play_sound(snd_ghook,1,0)
            nb = instance_create(x+(facing*64),y,obj_weapon)
            nb.from = id
            nb.facing = facing;
            nb.speed = 32 * facing
            cfire = 0
            }
        }
    }
