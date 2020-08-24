//Initialise Scribble, including loading our font automatically
scribble_init("", "fnt_antipasto32", true);

//Load in our source file from Chatterbox
chatterbox_load("example.yarn");

//Define a function that acts as a way for Chatterbox to open a URL from a Yarn source file
chatterbox_add_function("url_open", url_open_func);

//Create a new chatterbox and jump to the Start node
chatterbox = chatterbox_create("example.yarn", false);
chatterbox_goto(chatterbox, "Start");

//Update our text elements
refresh_text_elements();