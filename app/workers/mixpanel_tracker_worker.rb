require 'mixpanel-ruby'

class MixpanelTrackerWorker
  include Sidekiq::Worker

  def mixpanel(token)
    Mixpanel::Tracker.new(token)
  end

  # A call to track is a report that an event has occurred
  # http://mixpanel.github.io/mixpanel-ruby/Mixpanel/Tracker.html#method-i-track
  def perform(distinct_id, event, properties={})
    puts 'Entro a perform'
    network_id = Network.find_by_subdomain(properties['Subdomain']).id
    tracker = mixpanel(NetworkSetting.find_by_network_id(network_id).value) #aqui pasa el token guardado en la tabla NetworkSetting
    tracker.track distinct_id, event, properties
  end

end
