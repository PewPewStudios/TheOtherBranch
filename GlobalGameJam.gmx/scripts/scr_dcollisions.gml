//Top collision
/*
bg =  collision_rectangle(x-(sprite_get_width(sprite_index)/2),y-(sprite_get_height(sprite_index)/2),x+(sprite_get_width(sprite_index)/2),y,obj_player,false,true)
if(bg != noone)
{
   with(bg)
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
}
bg = noone; */
//bottom collision
bg = collision_rectangle(x-(sprite_get_width(sprite_index)/2)+15,y+(sprite_get_height(sprite_index)/2),x+(sprite_get_width(sprite_index)/2)-15,y,obj_player,false,true)
if(bg != noone)
{
    with(bg)
    {
        vspeed = abs(vspeed/2);
    }
}
bg = noone;
//Left Collision
bg = collision_rectangle(x-(sprite_get_width(sprite_index)/2) ,y-(sprite_get_height(sprite_index)/2),x-(sprite_get_width(sprite_index)/2)+15,y+(sprite_get_height(sprite_index)/2),obj_player,false,true)
if bg != noone
{
    with(bg)
    {
        hspeed = abs(hspeed) / 2
    }
}
bg = noone;
//Right Collision
bg = collision_rectangle(x+(sprite_get_width(sprite_index)/2) ,y-(sprite_get_height(sprite_index)/2),x+(sprite_get_width(sprite_index)/2)-15,y+(sprite_get_height(sprite_index)/2),obj_player,false,true)
if bg != noone
{
    with(bg)
    {
        hspeed = -abs(hspeed) / 2
    }
}
bg = noone;
