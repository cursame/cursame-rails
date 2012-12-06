class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_network
  helper_method :network_member
  helper_method :random_string_for_user_url
  helper_method :links
  helper_method :user_url
  helper_method :current_friend  
  
  #data of the networks you are
  def current_network
    @current_network ||= Network.find_by_subdomain(filter_subdomain(request.subdomain.downcase))
  end
  #this method filtered the subdomail
  def filter_subdomain(subdomain)
     if subdomain.match(/\Awww\..+/)
       return subdomain[4..-1]
     else
       return subdomain
     end
  end
  
  #this code generate the random_personal_url in the register user
  def random_string_for_user_url
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    string  =  (0...150).map{ o[rand(o.length)] }.join
  end
  #links to redirect the user to the networks
  def links
     case
       when Rails.env = 'development'
         @link = 'lvh.me:3000'
       when Rails.env = 'production'
         @link = 'cursa.me'
       when Rails.env = 'test'
         @link = 'cursatest.com'
     end
  end
  #determinate the first redirection url before loggin
  def user_url
     current_user.personal_url
  end
 
  #help to find friend
  def current_friend
      @user = User.find_by_personal_url(params[:personal_url])
  end
  
  ####### difininiendo variables de miembros de una red de forma global ########
  
  
  def network_member
          
             current_network.networks_users.each do |cu|
               @user_id = cu.user_id
                   @user_member = User.find_by_id(@user_id)
               return false
             end
             
             if @user_member == current_user.id
                @notice = "Bienvenido a #{current_network.name} "
              else
               render new_networks_user_path
            end
    
  end
 
 

end
