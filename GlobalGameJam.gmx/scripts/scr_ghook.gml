if ghook_active
    {
    dir = point_direction(ghook_x,ghook_y,x,y)
    dis = point_distance(ghook_x,ghook_y,x,y)
    if ghook_hspd = 0
        image_angle = dir +180
    else
        image_angle = 90
    /*
    if dis > 200
        {
        x = ghook_x+lengthdir_x(200,dir)
        y = ghook_y+lengthdir_y(200,dir)
        }
    if dis < 150
        {
        x = ghook_x+lengthdir_x(150,dir)
        y = ghook_y+lengthdir_y(150,dir)
        }
        */
    //if(ghook_x < x+256 || ghook_y < y+256)
    //if point_distance(x,y,ghook_x,ghook_y) < max_ghook_dis
    //    {
        ghook_x += ghook_hspd
        ghook_y += ghook_vspd
    //    }
    //else
    //    {
    //    ghook_active = 0
        /*
        dir = point_direction(ghook_x,ghook_y,x,y)
        ghook_hspd += cos(degtorad(dir)) * 10
        ghook_vspd += sin(degtorad(dir)) * 10
        ghook_x += ghook_hspd
        ghook_y += ghook_vspd
        */
    //    }
    if ghook_hspd != 0
    {
    if collision_circle(ghook_x,ghook_y,8,obj_ground,1,1)
        {
        audio_play_sound(snd_ghook_connect,1,0)
        ghook_hspd = 0
        ghook_vspd = 0
        ghook_dis = point_distance(x,y,ghook_x,ghook_y) - 64
        ghook_obj = instance_nearest(ghook_x,ghook_y,obj_ground)
        ghook_xoff = ghook_x - ghook_obj.x
        ghook_yoff = ghook_y - ghook_obj.y
        ghook_dir = point_direction(x,y,ghook_x,ghook_y)+180
        }
    ghook_dir = point_direction(x,y,ghook_x,ghook_y)
    }
    if ghook_hspd = 0
        {
        ghook_x = ghook_obj.x + ghook_xoff
        ghook_y = ghook_obj.y + ghook_yoff
        //if speed < 60
        //    {
        dir = point_direction(x,y,ghook_x,ghook_y)
        
        x1 = ghook_x+lengthdir_x(ghook_dis,dir)
        y1 = ghook_y+lengthdir_y(ghook_dis,dir)
        
        motion_add( point_direction(x,y,x1,y1) , .1)
        //sqr((point_distance(x,y,ghook_x,ghook_y)) )
        
            if point_distance(x,y,ghook_x,ghook_y) > ghook_dis
                {
                motion_add( point_direction(x,y,ghook_x,ghook_y) , sqr((point_distance(x,y,ghook_x,ghook_y) - ghook_dis) / 50) )
                //motion_add( point_direction(x,0,ghook_x,0) , .2 )
                //friction = friction_init
                }
            if point_distance(x,y,ghook_x,ghook_y) < ghook_dis
                {
                motion_add( point_direction(x,y,ghook_x,ghook_y)+180 , sqr((point_distance(x,y,ghook_x,ghook_y) - ghook_dis) / 50) )
                //motion_add( point_direction(x,0,ghook_x,0) , .2 )
                //friction = friction_init
                }
            //else friction = .2
        //    }
        }
    else
        {
        if point_distance(x,y,ghook_x,ghook_y) > 384
            ghook_active = 0
        //ghook_vspd+=1
        }
    }
else
    {
    image_angle = 90
    }
