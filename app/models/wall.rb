class Wall < ActiveRecord::Base
	belongs_to :publication, :polymorphic => true, :dependent => :destroy
	belongs_to :user
	belongs_to :wall
end
