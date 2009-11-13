puts %{
      #########################################################################
      #  Welcome to Organic Internet's Rails Application Template.            #
      #########################################################################
      }
      
# Remove unnecessary files
puts "**Removing unnecessary application files...**"
run "rm README"
run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"

# Initialize a git repository
puts "**Initializing an empty Git repository...**"
git :init

# Set up .gitignore files
puts "**Establishing files to ignore from Git repository...**"
file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

# Installing any additional Libraries
puts "**Installing any additional Libraries...**"
if yes?("Should jQuery be installed?")
  run "curl -L http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js > public/javascripts/jquery.js"
end
if yes?("Should SWFObject be installed?")
  run "curl -L http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js > public/javascripts/swfobject.js"
end

# Installing plugins as Git submodules
puts "**Installing plugins as Git submodules...**"
if yes?("Should HAML be installed?")
  plugin 'haml',  :git => "git://github.com/nex3/haml.git", :submodule => "true"
end
if yes?("Should will_paginate be installed?")
  plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git', :submodule => true
end
if yes?("Should paperclip be installed?")
  plugin 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git", :submodule => true
end

# Set up Git submodues
puts "**Setting up submodule repositories...**"
git :submodule => "init"

# Create the first repository commit
puts "**Adding first repository commit...**"
git :add => '.'
git :commit => "-a -m 'First Commit'"
 
puts %{
      #########################################################################
      #  Your Rails application has been successfully created.                #
      #  Have a nice day :)                                                   #
      ######################################################################### 
      }
