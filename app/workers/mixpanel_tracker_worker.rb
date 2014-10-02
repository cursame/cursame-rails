require 'mixpanel-ruby'

class MixpanelTrackerWorker
  include Sidekiq::Worker

  def mixpanel(token)
    Mixpanel::Tracker.new(token)
  end

  # A call to track is a report that an event has occurred
  # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/Tracker.html#method-i-track
  def perform(distinct_id, event, properties={})
    if !properties['Network'].nil? && properties['Network'] == "Galatea UACM"
      tracker = mixpanel Settings.mixpanel.galateauacm   
      tracker.track distinct_id, event, properties
    end
    tracker = mixpanel(Settings.mixpanel.token)
    tracker.track distinct_id, event, properties
  end

end
