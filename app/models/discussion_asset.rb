class DiscussionAsset < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :asset
end
