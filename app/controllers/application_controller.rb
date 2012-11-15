class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_network
  
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
end
