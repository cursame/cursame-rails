class Channel < ActiveRecord::Base
	has_many :mesages

	has_many :audiences, :dependent => :destroy
  has_many :users, :through => :audiences

end
