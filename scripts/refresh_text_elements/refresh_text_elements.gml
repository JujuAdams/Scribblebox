function refresh_text_elements()
{
    text_elements = [];
    
    //Set all the Scribble text we're going to cache to wrap
    scribble_set_wrap(room_width-200, -1);
    
    var _x = 100;
    var _y = 100;
    
    //Iterate over all the content strings
    var _i = 0;
    repeat(chatterbox_get_content_count(chatterbox))
    {
        //Cache a new text element
        var _element = scribble_cache(chatterbox_get_content(chatterbox, _i));
        
        //Tell it to fade in
        //Scribble text only fades in when scribble_draw() is called for it - we use this fact later!
        scribble_autotype_fade_in(_element, 1, 5, false);
        
        text_elements[@ array_length(text_elements)] = [_x, _y, _element];
        
        //Move down a bit to make each content string look like a paragraph
        _y += scribble_get_height(_element) + 25;
        ++_i;
    }
    
    //Ident our options slightly
    _x += 30;
    
    //Space out the options from the content a little too
    _y += 10;
    
    if (chatterbox_is_waiting(chatterbox))
    {
        //If we're in a waiting state (no options) then we should prompt the user to press space
        var _element = scribble_cache("(Press space)");
        scribble_autotype_fade_in(_element, 1, 5, false);
        text_elements[@ array_length(text_elements)] = [_x, _y, _element];
    }
    else
    {
        var _i = 0;
        repeat(chatterbox_get_option_count(chatterbox))
        {
            //Start formatting our string with some colour!
            switch(_i)
            {
                case 0: var _string = "[#90FF90]"; break;
                case 1: var _string = "[#FF9090]"; break;
                case 2: var _string = "[#FFFF90]"; break;
                case 3: var _string = "[#9090FF]"; break;
            }
            
            //Add a number prompt
            _string += string(_i+1) + ") ";
            
            //aaaand add the actual option string too
            _string += chatterbox_get_option(chatterbox, _i);
            
            //Cache a new text element
            var _element = scribble_cache(_string);
            
            //Tell it to fade in
            //Scribble text only fades in when scribble_draw() is called for it - we use this fact later!
            scribble_autotype_fade_in(_element, 1, 5, false);
            text_elements[@ array_length(text_elements)] = [_x, _y, _element];
            
            //Move down a bit to visually separate each option
            _y += scribble_get_height(_element) + 10;
            ++_i;
        }
    }
    
    //Reset the Scribble state so other stuff doesn't wrap as well
    scribble_reset();
}