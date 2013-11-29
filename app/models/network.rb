# -*- coding: utf-8 -*-
class Network < ActiveRecord::Base
  has_one :network_template#, :dependent => :destroy
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
  # Error por que la variable no fue inicializada al usar destroy
  has_many :libraries#, :dependent => :destroy
  #se declara la presencia y la dependencia de como deve leer el formato de subdominio asi como que el subdominio e único

  validates_presence_of   :name, :subdomain, :population
  validates_uniqueness_of :subdomain
  validates_format_of     :subdomain, :with => /^[\-a-z0-9]+$/



  #comentarios para las redes
  acts_as_commentable

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :permissionings

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

  #
  # Tiempo promedio que se tardan en contestar las tareas de una red
  #
  def averageTimeToResponseDeliveries
    courses = self.courses
    
    size = courses.size
    
    if (size == 0) then
      return 0.0
    end
    
    average = 0.0
    courses.each do |course|
      average += course.averageTimeToResponseDeliveries
    end
    
    return average/size
  end
  
  #
  # Tiempo promedio que se tardan en contestar los surveys de una red
  #
  def averageTimeToResponseSurveys
    courses = self.courses
    
    size = courses.size
    
    if (size == 0) then
      return 0.0
    end
    
    average = 0.0
    courses.each do |course|
      average += course.averageTimeToResponseSurveys
    end
    
    return average/size
  end

  #
  # Tiempo promedio que se tardan en contestar las tareas de todas las redes
  #
  def self.averageTimeToResponseDeliveries
    networks = Network.all
    
    size = networks.size
    
    if (size == 0) then
      return 0.0
    end
    
    average = 0.0
    networks.each do |network|
      average += network.averageTimeToResponseDeliveries
    end
    
    return average/size
  end
  
  #
  # Tiempo promedio que se tardan en contestar los surveys de todas las redes
  #
  def self.averageTimeToResponseSurveys
    networks = Network.all
    
    size = networks.size
    
    if (size == 0) then
      return 0.0
    end
    
    average = 0.0
    networks.each do |network|
      average += network.averageTimeToResponseSurveys
    end
    
    return average/size
  end

  #
  # Tiempo promedio que se tardan en calificar las tareas de una rede
  #
  def averageTimeToRateDeliveries
    courses = self.courses
    
    size = courses.size
    
    if (size == 0) then
      return 0.0
    end
    
    average = 0.0
    courses.each do |course|
      average += course.averageTimeToRateDeliveries
    end
    
    return average/size
  end

  #
  # Tiempo promedio que se tardan en calificar las tareas de todas las redes
  #
  def self.averageTimeToRateDeliveries
    networks = Network.all
    
    size = networks.size
    
    if (size == 0) then
      return 0.0
    end
    
    average = 0.0
    networks.each do |network|
      average += network.averageTimeToRateDeliveries
    end
    
    return average/size
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
end
