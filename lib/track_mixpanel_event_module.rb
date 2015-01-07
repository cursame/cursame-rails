module TrackMixpanelEventModule
  def track_event(user_id, event_name, event_data)
    begin
      puts "Network_id:= #{Network.find_by_subdomain(event_data['Subdomain']).network_settings[0].value}" 
      #puts "#{event_data['Subdomain'].class}"	
      puts "\e[1;32m[INFO]\e[0m mixpanel event: { user_id: #{user_id}, event_name: #{event_name}, event_data: #{event_data} }"
      MixpanelTrackerWorker.perform_async(user_id, event_name, event_data)
    rescue
      puts "\e[1;31m[ERROR]\e[0m error tracking mixpanel event: { user_id: #{user_id}, event_name: #{event_name}, event_data: #{event_data} }"
    end
  end
end
