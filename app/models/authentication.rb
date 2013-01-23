class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid, :name
  belongs_to :user
  
     def self.create_with_omniauth(auth)
       create! do |authentication|
         authentication.provider = auth["provider"]
         authentication.uid = auth["uid"]
         authentication.name = auth["info"]["name"]
       end
     end
end
