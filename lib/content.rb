def app_js_content
<<eos
// root_path
var root_path = "";
Ti.include("app/helper/general_includes.js");
Ti.include("app/controller/application_controller.js");

eos
end

def controller_content mvce
<<eos
var win = Titanium.UI.currentWindow;
// App root path
var root_path = "../../";
Ti.include("../helper/general_includes.js");

// Current view
Ti.include("../view/#{mvce}_view.js");

// Current events
Ti.include("../event/#{mvce}_events.js");
eos
end

def application_controller_content
<<eos
var win = Titanium.UI.currentWindow;

// Current view
Ti.include("app/view/application_view.js");

// Current events
Ti.include("app/event/application_events.js");

eos
end


def general_includes_content
<<eos
Ti.include(root_path + "config/application.js");
eos
end


def usage
<<eos
**********************************************************
You can generate MVCE skeleton app or add a VCE

Usage note: you can use either 'ti' or 'skeleti' at prompt. First parameter should be 'new' (n) or 'generate'(g).

Step by step to do for new project:
  1. cd in your new Titanium Mobile project
  2. To generate app skeleton, at prompt, type:
	    ti new      (or 'skeleti new')
  3. to generate another VCE: 
	    ti g my_controller		(where 'my_controller' is a new VCE you want to generate)


**********************************************************
eos
end