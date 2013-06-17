class Audience < ActiveRecord::Base
	belongs_to :user
  	belongs_to :channel, :dependent => :destroy
end
