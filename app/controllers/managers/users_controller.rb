class Managers::UsersController < Managers::BaseController
  def index
    @users = current_network.users.search(params[:search]).paginate(:per_page => 50, :page => params[:page]).order('users.first_name')
  end

  def show
    @user = User.find_by_id params[:id]
  end

  def new
    @user = User.new
  end

  def create
    params[:user][:subdomain] = current_network.subdomain
    params[:user][:domain] = request.domain
    params[:user][:personal_url] = SecureRandom.uuid
    user = User.new params[:user]
    redirect_to managers_users_path, flash: user.save ? { success: 'Usuario creado correctamente.' } : { error: 'Ocurrio un error al crear el usuario' }
  end

  def edit
    @user = User.find_by_id params[:id]
  end

  def update
    user = User.find_by_id params[:user][:id]
    user.update_attributes params[:user] if !user.nil? && user.permissionings.first.network == current_network
    redirect_to managers_users_path, flash: User.exists?(user) ? { error: 'Error al borrar el usuario' } : { success: 'Usuario borrado correctamente' }
  end

  def destroy
    user = User.find_by_id params[:id]
    user.destroy if !user.nil? && user.permissionings.first.network == current_network && user != current_user
    redirect_to managers_users_path, flash: User.exists?(user) ? { error: 'Error al borrar el usuario' } : { success: 'Usuario borrado correctamente' }
  end

  def import
    @users = current_network.users
  end

  def import_receiver
    network = current_network
    user_admin = current_user

    user_info = User.find_by_email("info@cursa.me") # Cambiar esto por info@cursa.me

    lastFile = Dir.glob("public/imports/import_users_*")    
    lastFile = lastFile.sort.map{|x| x.gsub(/[^0-9]/, '')}.map{|x| x.to_i}.sort.last
    if lastFile.nil? then
      name = "import_users_1.csv"
    else
      name = "import_users_" + lastFile.succ.to_s + ".csv"
    end

    text = ""
    begin
      File.open(params[:file].path,"r:ISO-8859-1").each do |line|
        text += line
      end

      path = "public/imports/" + name
      f = File.open(path,'w+')
      f.write(text)
      f.close
      
      domain = params["domain"]
      subdomain = network.subdomain

      puts '-----------'
      puts user_admin
      puts '-----------'

      user_info.delay.import(path, network, user_admin,domain,subdomain)
    #user_info.import(path,network,user_admin,domain,subdomain)

    rescue
      @noFile = true
    end

    redirect_to import_managers_users_path
  end

end