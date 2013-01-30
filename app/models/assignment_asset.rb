class AssignmentAsset < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :asset
end
