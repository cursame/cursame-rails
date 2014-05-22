class Permissioning < ActiveRecord::Base

  belongs_to :user
  belongs_to :role
  belongs_to :network

  after_create do
  	mixpanel_properties = { 'Network'  => Network.find_by_id(self.network_id).name }
	  MixpanelPeopleWorker.perform_async self.user_id, mixpanel_properties, false
  end

  after_update do
    mixpanel_properties = { 'Network'  => Network.find_by_id(self.network_id).name }
    MixpanelPeopleWorker.perform_async self.user_id, mixpanel_properties, false
  end

end
