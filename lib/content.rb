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