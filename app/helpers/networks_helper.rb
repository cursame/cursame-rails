module NetworksHelper
  def vlex_remote_auth

    params = { 
      account_id: current_network.find_setting(:vlex_account_id).value, 
      name: current_network.find_setting(:vlex_name).value, 
      token: current_network.find_setting(:vlex_token).value, 
      email: current_network.find_setting(:vlex_email).value
    }
    
    # Add timestamp
    params = params.clone # so that the delete at the end doesn't update the params hash
    params[:timestamp] = Time.now.to_i

    # Check that required parameters are present and concatenate them
    seed = ""
    keys = [:name, :email, :account_id, :token, :timestamp]
    keys.each do |key|
      raise ArgumentError.new "Missing parameter :#{key}" if params[key].nil?
      seed << params[key].to_s
    end
        
    # Add hash from the concatenated data
    params[:hash] = Digest::MD5.hexdigest(seed)
    params.delete(:token)
    
    # Generate the query and return the URL
    "http://vlex.com/session/remote_auth?#{params.to_query}"
  end
end