#### Upgrade your app to the latest 2.3 version and make sure all is well.
#### Create a new git branch
#### Create a new rvm gemset
#### Update the .rvmrc in the project to use the new gemset
#### Install rails gem (version 3.0.0)
→gem install rails -v 3.0.0
#### Run bundle command
→bundle
#### Install rails-upgrade plugin
→script/plugin install git://github.com/rails/rails_upgrade.git
#### Run rake:upgrade:check to get a list of TODOs and save it in the doc folder
→rake rails:upgrade:check > doc/rails_upgrade_check.txt
#### Backup important files
→rake rails:upgrade:backup
#### Backup Rakefile
→cp Rakefile Rakefile.rails2
#### Upgrade routes, run the below command and in your routes.rb file erase previous contents and copy the output of the command in its place.
→rake rails:upgrade:routes
#### Upgrade configuration, run the below command and copy output to config/application.rb
→rake rails:upgrade:configuration
#### Generate a new rails application on top of your existing application by running (assuming you are using mysql). Once you run the command, you need to appropriate override or keep files.
→rails new . -d <mysql/postgresql>
#### Remove preinitializer file
→rm -f config/preinitializer.rb
#### Update config.load_paths in application.rb to config.autoload_paths
#### Rails3 dosent load all the files in lib directory by default.
Add config.autoload_paths += %W(#{Rails.root/lib}) to the application.rb file
#### Try to start server
→rails s
#### If server dosent start trouble shoot and fix stuff.
#### Open the index page which shows rails details. Make sure everything looks good.
#### Stop server and delete that file.
→rm -f public/index.html
#### Fix the environment files for any missing settings from the previous version(Rails2).
#### Fix named_scope to scope in the models.
#### Fix before_validation_* and after_validation_* methods in the models to their Rails3 equivalents.
#### Change RAILS_DEFAULT_LOGGER to Rails.logger
#### Change RAILS_ENV to Rails.env
#### Change RAILS_ROOT to Rails.root
#### Remove any config.session_store custom setting from config/initializers/session.rb and put it in config/initializers/session_store.rb (this file rails3 generates). Also make sure to comment out any previous config.session_store setting in the config/initializers/session_store.rb file.
