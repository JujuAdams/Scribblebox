//Set the default font for Scribble to use
scribble_font_set_default("fnt_antipasto32");

//Load in our source file from Chatterbox
ChatterboxLoadFromFile("example.yarn");

//Define a function that acts as a way for Chatterbox to open a URL from a Yarn source file
ChatterboxAddFunction("url_open", url_open_func);

//Create a new chatterbox and jump to the Start node
chatterbox = ChatterboxCreate("example.yarn", false);
ChatterboxJump(chatterbox, "Start");

//Update our text elements
refresh_text_elements();