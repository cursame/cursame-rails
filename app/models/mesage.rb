class Mesage < ActiveRecord::Base
	belongs_to :user
	belongs_to :channel

	 #autoconversion de links, links inteligentes
  	auto_html_for :mesage do
	    html_escape
	    image :width => 250, :height => 128
	    # This is defined in config/initializers/auto_html.rb
	    dailymotion :width => 250, :height => 128
	    #flickr :width => 400, :height => 128
	    google_map :width => 250, :height => 128
	    google_video :width => 250, :height => 128
	    metacafe :width => 250, :height => 128
	    soundcloud :width => 250, :height => 128
	    twitter :width => 250, :height => 128
	    vimeo :width => 250, :height => 128
	    youtube :width => 250, :height => 128
	    slideshare_support :width => 250
	    ustream_support :width => 250
	    prezi_with_wmode :width => 250, :height => 128
	    livestrem_support :width => 250, :height => 128
	    link :target => "_blank", :rel => "nofollow"
	    redcarpet
	    #sanitize
	    simple_format
  	end


	after_create do
		users =  self.channel.users.reject{ |user| user.id == self.user_id }
		
		users.each do |user|			
		    PrivatePub.publish_to("/messages/notifications_user_"+user.id.to_s,
		       message: self,
		       sender: self.user,
		       reciever: user,
		       channel: self.channel
		    )
		    PrivatePub.publish_to(self.channel.channel_name+user.id.to_s,
		       message: self,
		       sender: self.user,
		       reciever: user,
		       channel: self.channel
		    )
		end
  end
end
