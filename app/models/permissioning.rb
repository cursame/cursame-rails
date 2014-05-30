class Permissioning < ActiveRecord::Base

  belongs_to :user
  belongs_to :role
  belongs_to :network

  after_create do
    begin
    	mixpanel_properties = { 'Network'  => Network.find_by_id(self.network_id).name }
  	  MixpanelPeopleWorker.perform_async self.user_id, mixpanel_properties, false
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end
  end

  after_update do
    begin
      mixpanel_properties = { 'Network'  => Network.find_by_id(self.network_id).name }
      MixpanelPeopleWorker.perform_async self.user_id, mixpanel_properties, false
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end
  end

end
