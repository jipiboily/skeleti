#!/usr/bin/ruby
require 'fileutils'
require 'file.rb'
require 'content.rb'

def is_ti_app?
  File.exists? 'tiapp.xml'
end

def already_generated?
  File.exists? 'Resources/app/helper/general_includes.js'
end

def msg m
  if ARGV[0]!='n' && ARGV[0]!='new'
    puts m
  end
end

def new_app
  if is_ti_app? && !already_generated?
    puts "generate app skeleton..."
    mkdir 'app'
    mkdir 'app/controller'
    mkdir 'app/event'
    mkdir 'app/helper'
    mkdir 'app/model'
    mkdir 'app/view'
    mkdir 'config'
    create_file 'config/application.js', "// you can put some global variables and settings in here..."
    generate 'application'
    
    FileUtils.mv 'Resources/app.js', 'Resources/app/view/application_view.js'
    create_file 'app.js', app_js_content
    create_file 'app/helper/general_includes.js', general_includes_content
    puts 'done!'
  else
    puts "This either an already genetared app or it is not a Titanium Mobile app at all!"
  end
end

def generate mvce
  if !mvce
    puts "no VCE name"
    return false
  end
  if File.exists? "Resources/app/controller/#{mvce}_controller.js"
    puts "This VCE has already been generated or at least the controller is present. Aborted!"
    return false
  end
  msg "generating '" + mvce + "'..."
    
  create_file "app/event/#{mvce}_events.js", "// Events for '#{mvce}'"
  create_file "app/view/#{mvce}_view.js", "// View for '#{mvce}'"
  if mvce != "application"
    create_file "app/controller/#{mvce}_controller.js", controller_content(mvce)
  else
    create_file "app/controller/#{mvce}_controller.js", application_controller_content
  end
  
  msg 'done!'
end

def parse_command_line a
  if a[0]=="g" || a[0]=="generate"
    generate a[1]
  elsif a[0]=="new" || a[0] == "n"
    new_app
  else
    puts usage
  end
end

parse_command_line ARGV