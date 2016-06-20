# encoding: UTF-8
namespace :meems do
  # run with: rake meems:mailer:welcome csv-file
  #
  # csv headers:
  # email
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

  # run with: rake meems:add:users csv-file
  #
  # csv headers:
  # subsystem,locality,cct,first_name,last_name,email,role_id
  namespace :add do
    task :users => :environment do
      csv_file = ARGV[1]
      CSV.foreach(csv_file, headers: :first_row) do |row|
        # build user
        user = build_user(row)
        user.permissionings.build permissioning_attributes(row)
        user.save if user.valid?
        log_user(user)

        # build course
        if (school = School.find_by_cct(row['cct']))
          course = school.course || build_course(row)
          log_updated_course
        else
          course = build_course(row)
          course.build_school school_attributes(row)
          log_created_course
        end
        course.members_in_courses.build member_in_course_attributes(user)
        course.save if course.valid?
        log_course(course)
      end
    end

    def build_user(row)
      User.new(
        :email        => row['email'],
        :password     => Devise.friendly_token.first(8),
        :first_name   => row['first_name'],
        :last_name    => row['last_name'],
        :personal_url => SecureRandom.uuid,
        :domain       => 'cursa.me',
        :subdomain    => 'meems',
      )
    end

    def permissioning_attributes(row)
      { role_id: row['role_id'], network_id: Network.find_by_subdomain('meems').id }
    end

    def build_course(row)
      Course.new(
        :title         => "#{row['subsystem']} #{row['locality']}",
        :silabus       => "CCT: #{row['cct']}",
        :init_date     => Date.today,
        :network_id    => Network.find_by_subdomain('meems').id,
      )
    end

    def school_attributes(row)
      # TODO: complete school info
      { cct: row['cct'] }
    end

    def member_in_course_attributes(user)
      {
        :user_id      => user.id,
        :network_id   => Network.find_by_subdomain('meems').id,
        :accepted     => true,
        :owner        => true,
        :active_satus => true,
      }
    end

    def log_user(user)
      message_color = user.valid? ? 32 : 31
      puts "user   : #{user.to_json(:only => [:email])}"
      puts "valid  : \e[1;#{message_color}m#{user.valid?}\e[0m"
    end

    def log_updated_course
      puts "course : updated"
    end

    def log_created_course
      puts "course : created"
    end

    def log_course(course)
      puts "course : #{course.school.to_json(:only => [:cct])}"
      puts "---"
    end
  end
end
