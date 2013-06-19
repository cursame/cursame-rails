class Content < ActiveRecord::Base
  attr_accessible :contentye_type, :contentye_id, :content, :contents_attributes
  belongs_to :contentye, :polymorphic =>:true
    
end
