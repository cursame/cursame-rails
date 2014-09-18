require 'devise/strategies/authenticatable'
module Devise
  module Strategies
    class Subdomain < Base
      def valid?
        params['user'].blank? ? false : true
      end
      def authenticate!
        user = User.find_by_email params['user']['email']
        if !user.nil? && user.valid_password?(params['user']['password'])
          subdomains = user.permissionings.map { |p| p.network.subdomain.downcase unless p.network.nil? }
          (subdomains.include?(request.subdomain) || user.superadmin?) ? success!(user) : fail!("")
        else
          fail!("No existe el usuario")
        end
      end
    end
  end
end