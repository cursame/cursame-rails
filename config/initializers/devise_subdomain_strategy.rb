
require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class Subdomain < Base
      def valid?
        params['user'].blank? ? false : true
      end

      def authenticate!
        user = User.find_by_email(params['user']['email'])

        if user && user.valid_password?(params['user']['password'])
          if user.permissionings.first.role_id == 4
            success!(user)
          else
            subdomain = user.permissionings.first.network.subdomain
            subdomain == request.subdomain.downcase ? success!(user) : fail!
          end 
        else
          fail!
        end

      end
    end
  end
end