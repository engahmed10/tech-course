# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'


Rails.application.load_tasks

namespace :db do
    task :backup do
      system "sqlite3 --opt --user=root --password rose userdetails> xyz.sql"
    end
  
    task :restore do
      system "sqlite3 --user=root --password  < xyz.sql"
    end
end