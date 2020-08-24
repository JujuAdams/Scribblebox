if (chatterbox_is_stopped(chatterbox))
{
    //If we've stopped we should say so
    //In a real game you'd close the dialogue system and permit user interaction again
    scribble_draw(10, 10, "(Chatterbox stopped)");
}
else
{
    //Iterate over all of our text elements and draw them
    //We cache text elements for drawing in refresh_text_elements()
    var _i = 0;
    repeat(array_length(text_elements))
    {
        //Get our text element and position
        var _array = text_elements[_i];
        var _x       = _array[0];
        var _y       = _array[1];
        var _element = _array[2];
        
        //Draw the text element
        scribble_draw(_x, _y, _element);
        
        //Break out of the loop if this text element hasn't finished fading in
        if (scribble_autotype_get(_element) < 1.0) break;
        //Autotype will only happen when you actually draw the text element
        //This means if we don't want to fade text in we can just... not draw it
        
        ++_i;
    }
}