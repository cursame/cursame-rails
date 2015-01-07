require 'mixpanel-ruby'

class MixpanelTrackerWorker
  include Sidekiq::Worker

  def mixpanel(token)
    Mixpanel::Tracker.new(token)
  end

  # A call to track is a report that an event has occurred
  # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/Tracker.html#method-i-track
  def perform(distinct_id, event, properties={})
    tracker = mixpanel(Network.find_by_subdomain(properties['Subdomain']).network_settings[0].value) #aqui pasa el token guardado en la tabla NetworkSetting
    tracker.track distinct_id, event, properties
  end

end
