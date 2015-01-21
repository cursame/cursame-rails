module TrackMixpanelEventModule
  def track_event(user_id, event_name, event_data)
    begin 
      MixpanelTrackerWorker.perform_async(user_id, event_name, event_data)
    rescue
      puts "\e[1;31m[ERROR]\e[0m error tracking mixpanel event: { user_id: #{user_id}, event_name: #{event_name}, event_data: #{event_data} }"
    end
  end
end
