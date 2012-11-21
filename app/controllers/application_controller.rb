class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_network
  helper_method :member
  helper_method :random_string_for_user_url
  def current_network
    @current_network ||= Network.find_by_subdomain(filter_subdomain(request.subdomain.downcase))
  end
  
  def filter_subdomain(subdomain)
     if subdomain.match(/\Awww\..+/)
       return subdomain[4..-1]
     else
       return subdomain
     end
  end
  
  def member
    @member = NetworksUsers.where(:network_id => current_network.id )
  end
  
  def random_string_for_user_url
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    string  =  (0...150).map{ o[rand(o.length)] }.join
  end

end
