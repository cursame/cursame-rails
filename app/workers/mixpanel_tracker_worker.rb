require 'mixpanel-ruby'

class MixpanelTrackerWorker 
	include Sidekiq::Worker
    
    def mixpanel()
        Mixpanel::Tracker.new(Settings.mixpanel.token)
    end

    # A call to track is a report that an event has occurred
    # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/Tracker.html#method-i-track
    def perform(distinct_id, event, properties={})
        begin
            puts "\e[1;32m[INFO]\e[0m sending event task to mixpanel \e[1;34m=>\e[0m user_id: #{distinct_id}, event: #{event}, properties: #{properties}"
            tracker = mixpanel()
            tracker.track distinct_id, event, properties
        rescue
            puts "\e[1;31m[ERROR]\e[0m ending data to mix panel \e[1;34m=>\e[0m user_id: #{distinct_id}, event: #{event}, properties: #{properties}"
        end
    end

end