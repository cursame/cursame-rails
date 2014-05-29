require 'mixpanel-ruby'

class MixpanelPeopleWorker
    include Sidekiq::Worker
    
    def mixpanel()
        Mixpanel::Tracker.new(Settings.mixpanel.token)
    end

    # Appends a values to the end of list-valued properties. If the given properties 
    # don’t exist, a new list-valued property will be created.
    # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/People.html#method-i-set
    # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/People.html#method-i-append
    def perform(distinct_id, properties, new_profile=true)
        begin
            tracker = mixpanel()
            if new_profile then
                puts "\e[1;32m[INFO]\e[0m creating mixpanel people profile \e[1;34m=>\e[0m user_id: #{distinct_id}, properties: #{properties}"
                tracker.people.set distinct_id, properties
            else
                tracker.people.append distinct_id, properties
                puts "\e[1;32m[INFO]\e[0m updating mixpanel people profile \e[1;34m=>\e[0m user_id: #{distinct_id}, properties: #{properties}"
            end
        rescue
            puts "\e[1;31m[ERROR]\e[0m error sending data to mix panel \e[1;34m=>\e[0m user_id: #{distinct_id}, properties: #{properties}"
        end
    end

end