class UtilityHelper < ActiveRecord::Base
  
  def self.call_rake(task,options={})
    options[:rails_env] ||= Rails.env
    args = options.map{ |n,v| "#{n.to_s.upcase}='#{v}'"}
    system "bundle exec rake #{task} #{args.join(' ')} --trace 2>&1 >> log/rake.log &"
  end 
  
  def self.call_multiples_rake(tasks)
    tasks.each do |array|
      task = array[0]
      options = array[1]
      options[:rails_env] ||= Rails.env
      args = options.map{ |n,v| "#{n.to_s.upcase}='#{v}'"}
      system "bundle exec rake #{task} #{args.join(' ')} --trace 2>&1 >> log/rake.log"
    end
  end
end
