class DeliveryAsset < ActiveRecord::Base
  belongs_to :asset
  belongs_to :delivery
end
