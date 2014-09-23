module NetworksHelper
  include NetworksUtils

  # Example:
  # data = {:account_id => "1234", :name => "tester", :token => "TOKEN", :email => "test@vlex.com"}
  # puts vlex_remote_auth data
  def vlex_remote_auth(params)
    vlex_remote_auth_url = "http://vlex.com/session/remote_auth"
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
    "#{vlex_remote_auth_url}?#{params.to_query}"
  end

  def get_network_students
    return network_students
  end

  def get_network_teachers
    return network_teachers
  end

  def get_network_managers
    return network_managers
  end
end