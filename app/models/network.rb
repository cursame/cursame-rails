# -*- coding: utf-8 -*-
class Network < ActiveRecord::Base
  has_one :network_template#, :dependent => :destroy
  has_one :wufoo_setting, dependent: :destroy

  has_many :permissionings, :dependent => :destroy
  has_many :users, :through => :permissionings
  has_many :discussions, :dependent => :destroy
  has_many :deliveries#, :dependent => :destroy
  has_many :courses, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :surveys#, :dependent => :destroy
  #walls
  has_many :walls, :dependent => :destroy
  #library
  has_many :libraries#, :dependent => :destroy
  has_many :network_settings
  has_many :wufoo_forms, as: :showable, dependent: :destroy
  has_many :reported_contents, dependent: :destroy

  validates_presence_of   :name, :subdomain, :population
  validates_uniqueness_of :subdomain
  validates_format_of     :subdomain, :with => /^[\-a-z0-9]+$/


 
  #comentarios para las redes
  acts_as_commentable

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :permissionings
  accepts_nested_attributes_for :wufoo_setting

  #uploader de imagenes de fondo de redes
  
  mount_uploader :image_front, BackendFromNetworkUploader
  mount_uploader :logo, LogoNetworkUploader
  
  after_create do
    gospel_add_network
  end

  def radar_token?
    !find_setting(:radar_token).nil?
  end

  def radar_token
    radar_token? ? find_setting(:radar_token).value : ""
  end

  def find_setting(property)
    self.network_settings.find { |s| s.property == property.to_s }
  end

  def owner?(role,user)
    return false
  end

  def publications (user_id, network_id)
    Wall.scoped(:include =>{
          :users => :userpublicationings,
          :courses => :coursepublicationings,
          :courses => :members_in_courses
    },
    :conditions => ["(walls.network_id = ?) AND
       (userpublicationings.user_id = ? OR walls.public = ?) OR
      (members_in_courses.accepted = ? AND members_in_courses.user_id = ? AND walls.publication_type != 'Comment') ",network_id,user_id,true,true, user_id]).order('walls.created_at DESC')
      # :conditions => ["(walls.network_id = ?) AND
      #                 ((walls.public = ? AND walls.publication_type != 'Comment') OR (userpublicationings.user_id = ? AND walls.publication_type != 'Comment')) OR
      #                 (members_in_courses.accepted = ? AND members_in_courses.user_id = ? AND walls.publication_type != 'Comment')",network_id,true,user_id,true, user_id]).order('walls.created_at DESC')


  end


  def send_email(admin, users, subject, message)
    users.each do |user|
      if (admin != user) then
        begin
          mail = Notifier.send_email(user,subject,message)
          mail.deliver
        rescue
        end
      end
    end
  end

  handle_asynchronously :send_email, :priority => 20, :run_at => Proc.new{Time.zone.now}

  def averageCalificationSurvey
    surveys = self.surveys
    if surveys.size == 0 then
      return 0.0
    end

    average = 0.0

    surveys.each do |survey|
      average += survey.averageCalification
    end
    return average/surveys.size
  end

  def averageCalificationDelivery
    deliveries = self.deliveries

    if deliveries.size == 0 then
      return 0.0
    end

    average = 0.0

    deliveries.each do |delivery|
      average += delivery.averageCalification
    end
    return average/deliveries.size
  end
  
  def self.averageNetworkSurvey
    networks = Network.all
    if (networks.size == 0) then
      return 0
    end
    average = 0.0
    networks.each do |network|
      average = network.averageCalificationSurvey
    end

    return average/networks.size
  end

  def self.averageNetworkDelivery
    networks = Network.all
    if (networks.size == 0) then
      return 0
    end
    average = 0.0
    networks.each do |network|
      average = network.averageCalificationDelivery
    end

    return average/networks.size
  end
  
  ##### definiciones de cambios de etiquetas especializadas.
  
  def user_tag
    @defter = (self.titles).to_s.split(',')[0]
    @self_defter = @defter.split(':').last   
  end
  
  def profesor_tag
    @defter = (self.titles).to_s.split(',')[1]
    @self_defter = @defter.split(':').last
  end
  
  def student_tag
    @defter = (self.titles).to_s.split(',')[2]
    @self_defter = @defter.split(':').last
  end
  
  def admin_tag
    @defter = (self.titles).to_s.split(',')[3]
    @self_defter = @defter.split(':').last
  end
  
  def course_tag
     @defter = (self.titles).to_s.split(',')[4]
     @self_defter = @defter.split(':').last
  end
  
  def courses_tag
     @defter = (self.titles).to_s.split(',')[5]
     @self_defter = @defter.split(':').last
  end
  
  def friend_tag
     @defter = (self.titles).to_s.split(',')[6]
     @self_defter = @defter.split(':').last
  end
  
  def friends_tag
     @defter = (self.titles).to_s.split(',')[7]
     @self_defter = @defter.split(':').last
  end
  
  def comunity_tag
      @defter = (self.titles).to_s.split(',')[8]
      @self_defter = @defter.split(':').last
  end

  def mixpanel_token?
    !self.find_setting(:mixpanel_token).nil?
  end

  def wufoo_settings?
    !self.wufoo_setting.nil? && !self.wufoo_setting.subdomain.blank? && !self.wufoo_setting.api_key.blank?
  end

  def wufoo_forms
    begin
      wufoo.forms
    rescue Errors::MissingWufooSettingsError, SocketError
      []
    end
  end

  private
  def gospel_add_network
    Gospel::NetworksWorker.perform_async(self.name, self.subdomain)
  end

  def wufoo
    raise Errors::MissingWufooSettingsError unless wufoo_settings?
    WuParty.new self.wufoo_setting.subdomain, self.wufoo_setting.api_key
  end
end
