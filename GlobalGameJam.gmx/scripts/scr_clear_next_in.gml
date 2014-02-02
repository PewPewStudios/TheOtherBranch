//scr_clear_next_in(str)

newstr=""

for(i=0 ; string_char_at(argument0,i) != "," && i<string_length(argument0) ; i++ )
    {
    newstr+=string_char_at(argument0,i)
    }
    
return string_copy( argument0 , string_length(newstr)+1 , string_length(argument0) - ( string_length(newstr)+1 ) )
