# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "log/development.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

#every 2.minutes do
 #   runner "Delivery.active_inactive", :environment => 'development' 
#end
set :environment, 'development'

#every :day, :at => '12:30am' do
every :day, :at => "11:06pm"  do
  puts "*************************************************************"
  puts "*************************************************************"
  puts "*************************************************************"
  puts "*************************************************************"
  puts "********************Runing TASK*****************************"
  
  rake 'cleaner_inconsistences.task',  :environment => 'development' 
 #rake :cleaner_inconsistences,  :environment => 'development' 
end

# Learn more: http://github.com/javan/whenever
