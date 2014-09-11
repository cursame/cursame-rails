class NetworkProperty < ActiveRecord::Base
  attr_accessible :name
	
	@@instance = nil

	def self.createNetworkProperty(nameProperty)
		property = NetworkProperty.find_by_name nameProperty
		if property.nil?
			@@instance = NetworkProperty.new(:name => nameProperty)
			@@instance.save
		else
			@@instance = property
		end
	end

	def self.getNetworkProperty(nameProperty)
		@@instance = NetworkProperty.Find_by_name nameProperty
	end

	def self.getNetworkProperties
		NetworkProperty.all
	end

	private_class_method :new
end
