//COLLISIONS

if collision_circle(x,y-sprite_height/2,3,obj_ground,1,1)
vspeed = abs(vspeed) / 2

if collision_circle(x-sprite_width/2,y,3,obj_ground,1,1)
hspeed = abs(hspeed) / 2

if collision_circle(x+sprite_width/2,y,3,obj_ground,1,1)
hspeed = -abs(hspeed) / 2

//Platform Collisions

if vspeed > 0
if collision_circle(x,y+sprite_height/2,3,obj_ground,1,1)
    {
    ng = instance_nearest(x,y+32,obj_ground)
    if ghook_active = 0
        hspeed = ng.hspeed
    jumps = 0
    if y < ng.y - 48 + vspeed
        {
        y = ng.y-64
        //y-=1
        vspeed = 0
        }
    }
    
if collision_line(x+16,y-16,x+16*facing,y+16,obj_ground,1,1)
if vspeed > 0
    {
    hspeed = 0
    }
