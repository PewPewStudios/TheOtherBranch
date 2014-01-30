//joystick_check_pressed(id,button)
/*
if joystick_check_button(argument0,argument1)
if obj_controls.jbutton_prev[argument0,argument1]
    {
    if obj_controls.jbutton_prev[argument0,argument1] = 0
        {
        obj_controls.jbutton_pressed[argument0,argument1] = 1
        obj_controls.jbutton_prev[argument0,argument1] = 1
        }
    else
        {
        obj_controls.jbutton_pressed[argument0,argument1] = 0
        }
    }
*/
return obj_controls.jbutton_pressed[argument0,argument1]
