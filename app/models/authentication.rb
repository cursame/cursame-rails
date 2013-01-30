class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid, :name
  belongs_to :user
  
     def self.create_with_omniauth(auth)
       create! do |authentication|
         authentication.provider = auth["provider"]
         authentication.uid = auth["uid"]
         ##### for facebook
         authentication.name = auth["info"]["name"]
         #### for google
         authentication.client_secret = auth["client_secret"]
         
       end
     end
end
