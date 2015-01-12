class Mesage < ActiveRecord::Base
  include TrackMixpanelEventModule
  
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

    ###### prepramos validacion para saber de que tipo de canal se trata #####

    split_to_name_channel = self.channel.channel_name.split('/').last
    split_type = split_to_name_channel.split('_').first

    case split_type
    when "course"
      PrivatePub.publish_to(self.channel.channel_name,
                            message: self,
                            sender: self.user,
                            reciever: user,
                            channel: self.channel
                            )
    when "users"
      users =  self.channel.users.reject{ |user| user.id == self.user_id }
      # user_ids = self.user.friends(true).map{|user| [user.id,user.online] }

      if users.empty? #si no hay usuarios en el canal solo le publica a el
        PrivatePub.publish_to(self.channel.channel_name,
                              message: self,
                              sender: self.user,
                              reciever: user,
                              channel: self.channel
                              )
      else
        users.each do |user|
          PrivatePub.publish_to("/messages/notifications_user_"+user.id.to_s,
                                message: self,
                                sender: self.user,
                                reciever: user,
                                channel: self.channel
                                )

          PrivatePub.publish_to(self.channel.channel_name,
                                message: self,
                                sender: self.user,
                                reciever: user,
                                # usersIds:user_ids,
                                channel: self.channel
                                )
        end
      end


    end
    track_mixpanel_message
  end

  def title
    return ""
  end

  private
  def track_mixpanel_message
    event_data = {
      'Network'   => self.user.networks.first.name,capitalize,
      'Subdomain' => self.user.networks.first.subdomain,
      'Role'      => self.user.role_title.capitalize,
      'Type'      => self.channel.channel_type
    }
    track_event self.user.id, 'Message', event_data
  end

end
