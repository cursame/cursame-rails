module MixpanelEventTracker
  def track_event(user_id, event_name, event_data)
    begin
      MixpanelTrackerWorker.perform_async user_id, event_name, event_data
      puts "\e[1;32m[INFO]\e[0m tracking mixpanel event for #{event_name}"
    rescue
      puts "\e[1;31m[ERROR]\e[0m error tracking mixpanel event for #{event_name}"
    end
  end
end
