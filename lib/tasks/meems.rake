# encoding: UTF-8
namespace :meems do
  namespace :mailer do
    task :welcome => :environment do
      csv_file = ARGV[1]
      CSV.foreach(csv_file) do |row|
        email = row[0]
        puts "\e[1;32minfo:\e[0m sending email to '#{email}"
        MeemsMailer.welcome(email).deliver
      end
    end
  end
end
