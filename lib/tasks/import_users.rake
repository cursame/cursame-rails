desc "Import users"
task :import_users => :environment do
  network_id = ENV["NETWORK_ID"].to_i
  file = ENV["FILE"]
  #user_admin_id = ENV["USER_ADMIN_ID"].to_i
  
  
  a = Time.now
  
  arrayErrores = Array.new
  count = 0
  
    CSV.foreach(file, headers: true) do |row|
      count += 1
      if !row["id"].nil? then
        user = User.find_by_id(row["id"]) || User.new
      else
        user = User.new
      end
      hash = row.to_hash
      role_id = hash.delete("Role")
      errors = false

      if !role_id.nil? then
      
        role_id = role_id.downcase.strip
        role_id = 2 if role_id == "estudiante"
        role_id = 3 if role_id == "maestro"
      else
        arrayErrores.push({ :line => count,:message => "No se especifico un role"})
        errors = true
      end

      if role_id.class != Fixnum then
        arrayErrores.push({:line => count, :message => "El role esta incorrecto"})
        errors = true
      end

      email = hash.delete("Email")
      #user.email = email

      if !email.nil? then
        #user.email = user.email.downcase
        # Checa que el correo sea valido y que no se repita
        if email["@"].nil? || !(User.find_by_email(email).nil?)
          arrayErrores.push({:line => count, :message => "El correo no es valido o ya existe en la DB" })
          errors = true
        else
          user.email = email
        end
      else
        arrayErrores.push({:line => count, :message => "No hay ningun email especificado"})
        errors = true
      end

      # Nombre y apellido en mayusculas
      user.first_name = user.first_name.capitalize if !user.first_name.nil?
      user.last_name = user.last_name.capitalize if !user.last_name.nil?

      # Checa que exista el role_id
      if role_id.nil? then
        arrayErrores.push({:line => count, :message => "Debes de especificar un role para el usuario" })
        errors = true
      end

      if !role_id.nil? then
        if Role.find_by_id(role_id).nil? then
          arrayErrores.push({:line => count, :message => "No existe el rol dado"})
          errors = true
        end
      end

      password = Devise.friendly_token.first(6)
      charList =  [('a'..'z'),('A'..'Z'),(0..9)].map{ |i| i.to_a }.flatten.map{ |i| i.to_s }

      personal_url_random = (0...100).map{  charList[rand(charList.length)] }.join
      user.password = password
      user.personal_url = personal_url_random
      user.accepted_terms = true

      if !errors then
        begin
          user.save!
        rescue ActiveRecord::RecordInvalid => invalid
          invalid.record.errors.each do |error|
            arrayErrores.push({:line => count, :message => "Falta especificar: " + error.to_s})
          end
        end
        if !(user.save) then
          arrayErrores.push({:line => count, :message => "Error al guardar"})
        else
           #user.confirm!
           #user.save!
          Permissioning.create!(:role_id => role_id.to_i,:network_id => network_id, :user_id => user.id)
          # mail = Notifier.send_password(user,password)
          # mail.deliver
        end
      end
    end
  
  #user = User.find(user_admin_id)
  arrayErrores.each do |hash|
    print hash[:line].to_s  + " " +  hash[:message]
    puts ""
  end
  #mail = Notifier.send_import(user,arrayErrores)
  #mail.deliver
  
  #system "rm #{file}"
  b = Time.now
  puts "Tiempo total de la transaccion: " + (b - a).to_s
  
end