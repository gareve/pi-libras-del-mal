## rake --tasks
## rake new_db
## rake pop_db

require 'bundler/setup'
Bundler.require
require './models/persistence'

desc 'Create a new database from scratch'
task :new_db  do
   puts '##################'
   puts '## New Database ##'
   puts '##################'

   DataMapper.auto_migrate!
end

desc 'Populate db with test data'
task :pop_db => :new_db do

   start_time = Time.now

   puts '###################'
   puts '## Populating db ##'
   puts '###################'

   populate_db

   end_time = Time.now

   printf "Total time: %d sec.\n",end_time.to_i - start_time.to_i
end
