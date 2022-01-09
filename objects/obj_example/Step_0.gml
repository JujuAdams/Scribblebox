#region Work out if all of our text elements have stopped fading in

var _complete = true;
var _i = 0;
repeat(array_length(text_elements))
{
    if (text_elements[_i].typist.get_state() < 1.0)
    {
        _complete = false;
        break;
    }
    
    ++_i;
}

#endregion

if (_complete)
{
    //If all of the text element have faded in, allow for user input
    
    if (ChatterboxIsWaiting(chatterbox)) //If Chatterbox is waiting for the user to press space... then... check for... that..
    {
        if (keyboard_check_pressed(vk_space))
        {
            ChatterboxContinue(chatterbox);
            //Always update your text elements after advancing chatterbox!
            refresh_text_elements();
        }
    }
    else if (ChatterboxGetOptionCount(chatterbox)) //If Chatterbox is presenting the user with some options, check for that
    {
        var _index = undefined;
        if (keyboard_check_pressed(ord("1"))) _index = 0;
        if (keyboard_check_pressed(ord("2"))) _index = 1;
        if (keyboard_check_pressed(ord("3"))) _index = 2;
        if (keyboard_check_pressed(ord("4"))) _index = 3;
        
        if (_index != undefined)
        {
            //If the player pressed a number key, choose the corresponding option
            ChatterboxSelect(chatterbox, _index);
            //Always update your text elements after advancing chatterbox!
            refresh_text_elements();
        }
    }
}
else
{
    //If the text elements *haven't* all finished fading in...
    if (keyboard_check_pressed(vk_space))
    {
        //...and the player has pressed space then tell our Scribble typisy to skip the fade in and just display all the text
        var _i = 0;
        repeat(array_length(text_elements))
        {
            text_elements[_i].typist.skip();
            ++_i;
        }
    }
}