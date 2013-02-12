class Wall < ActiveRecord::Base
	belongs_to :publication, :polymorphic => true
	belongs_to :user
end
