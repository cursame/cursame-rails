class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    
          omniauth = request.env["omniauth.auth"]
          @authentication = Authentication.find_by_provider_and_uid(omniauth["provider"], omniauth["uid"]) || Authentication.create_with_omniauth(omniauth)
          if @authentication.save
             @colgomorov = Authentication.find(@authentication.id)
             @colgomorov.user_id = current_user.id
             
             
              client = Google::APIClient.new
              @token = omniauth["credentials"]["token"]
              client.authorization.access_token = @token
                 service = client.discovered_api('calendar', 'v3')
                 @result = client.execute(
                   :api_method => service.calendar_list.list,
                   :parameters => {'calendarId' => 'primary'},
                   :headers => {'Content-Type' => 'application/json'})
                     
                       @calendar = @result.request.api_method.api.discovery_document
                       puts @calendar
                       
                raise  @calendar.to_yaml
                       
             @colgomorov.save 
             #redirect_to calendar_index_path, :notice => "Authentication Successfully created!!"
          else
            # redirect_to calendar_index_path, :notice => "Authentication not created!!"
             
          end
          
   end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to :back, :notice => "Successfully destroyed authentication."
  end
end
