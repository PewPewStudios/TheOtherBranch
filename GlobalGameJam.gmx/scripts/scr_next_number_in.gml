//scr_next_number_in(str)

newstr=""

for(i=1 ; string_char_at(argument0,i) != "," && i<string_length(argument0) ; i++ )
    {
    newstr+=string_char_at(argument0,i)
    }
    
return real(newstr)
