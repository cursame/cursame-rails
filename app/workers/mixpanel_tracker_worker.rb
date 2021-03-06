require 'mixpanel-ruby'

class MixpanelTrackerWorker
  include Sidekiq::Worker

  def mixpanel(token)
    Mixpanel::Tracker.new(token)
  end

  # A call to track is a report that an event has occurred
  # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/Tracker.html#method-i-track
  def perform(distinct_id, event, properties={})
    tracker = mixpanel(Settings.mixpanel.token)
    tracker.track distinct_id, event, properties
    network = Network.find_by_subdomain(properties['Subdomain'])
    if !network.nil? && network.mixpanel_token?
      tracker = mixpanel(network.find_setting(:mixpanel_token).value)
      tracker.track distinct_id, event, properties
    end
  end

end
