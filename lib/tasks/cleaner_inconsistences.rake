task :cleaner_inconsistences => :environment do
@d = Delivery.all
@s = Survey.all
@n = Notification.all
@a = Assignment.all
@f = Friendship.all
@c = Comment.all
@m = MembersInCourse.all
@mco = Course.all

puts "\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
puts "---------------------------------------------------------------------------------------"
puts "| Task de limpieza de inconsistncias en cursame by Alfredo Rifa Free forever pro 2013 |"
puts "---------------------------------------------------------------------------------------"
puts "\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"

puts "******************** Encontrando los deliveries y surveys sin curso **********************"

 @d.each do |d|        
   if d.courses == nil
   puts "delivery sin curso"
   puts d.id
   d.destroy
   else
    puts "delivery con curso"
   end
 end
 
 @s.each do |s|        
   if s.courses == nil
   puts "survey sin curso"
   puts s.id
   s.destroy
   else
     puts "survey con curso"
   end
 end
 
puts "******************** Encontrando las notificaciones sin notificator y sin user *******************"

@n.each do |n|        
   if n.notificator_id == nil
   puts "sin identificador"
   puts n.id
   n.destroy
   else
    puts "con identificador"
   end
   
   if n.notificator_type == nil
   puts "sin tipo"
   puts n.id
   n.destroy
   else     
   puts "con tipo"
   end
   
   if n.users == nil
    puts "sin usuarios"
    puts n.id
    n.destroy
    else     
    puts "con usuarios"
   end
   
    if n.kind == nil
     puts "sin kind"
     puts n.id
     n.destroy
     else     
     puts "con kind"
    end
    
 end
 
puts "******************** Delimintando Assigments limpiando y corrigiendo *******************"

@a.each do |a|        
   if a.delivery == nil
   puts "sin tarea"
   puts a.id
   a.destroy
   else
    puts "con tarea"
   end
   
   if a.course == nil
   puts "sin curso"
   puts a.id
   a.destroy
   else     
   puts "con tipo"
   end
   
   if a.user == nil
    puts "sin curso"
    puts a.id
    a.destroy
    else     
    puts "con curso"
   end
       
end

puts "******************** Buscando solicitudes de amistad fallidas *******************"
@f.each do |f|        
   if f.friend_id == nil
   puts "sin amigo"
   puts f.id
   f.destroy
   else
    puts "con amigo"
   end
   
   if f.user_id == nil
   puts "sin propietario"
   puts f.id
   f.destroy
   else     
   puts "con propietario"
   end
end

puts "******************** Buscando comment sin usuario y eliminandolo *******************"

@c.each do |c|        
   if c.user == nil
   puts "comment sin usuario"
   puts c.id
   c.destroy
   else
    puts "comment con usuario"
   end
end

puts "******************** Limpiando notificaciones que tengan inconsistencias de existente de los notificado *******************"

@n.each do |nk|
  type = nk.notificator_type 
  case
  when type == 'Delivery'
     dl = Delivery.exists?(nk.notificator_id)
     puts dl
     if dl == false
       nk.destroy
       puts "se ha eliminado la notificacion"
       
     end
  when type == 'Survey'
     sv = Survey.exists?(nk.notificator_id)
     puts sv
     if sv == false
        nk.destroy
        puts "se ha eliminado la notificacion"
        
     end
  when type == 'Assignment'
     as = Assignment.exists?(nk.notificator_id)
     puts as
     if as == false
         nk.destroy
         puts "se ha eliminado la notificacion"
         
     end
  when type == 'Comment'
     cmt = Comment.exists?(nk.notificator_id)
     puts cmt
    if cmt == false
        nk.destroy
        puts "se ha eliminado la notificacion"
        
    end
  when type == 'Discussion'
     ds = Comment.exists?(nk.notificator_id)
     puts ds 
     if ds == false
         nk.destroy
         puts "se ha eliminado la notificacion"
     end
  end
end
  


puts "******************** Assignando aclaracion de  mienbros del curso insconsistencias *******************"

@m.each do |m|        
   if m.owner == nil
   puts "comment sin usuario"
   puts m.id
   m.owner = false
   m.save
   else
    puts "comment con usuario"
   end
   if m.active_status == nil
    puts "comment sin usuario"
    puts m.id
    m.active_status = false
    m.save
    else
     puts "comment con usuario"
   end
   if m.accepted == nil
      puts "comment sin usuario"
      puts m.id
      m.accepted = false
      m.save
      else
       puts "comment con usuario"
    end
end

puts "******************** Encontrando si el curso tine owner o si no asignando el primer miembro del curso a ser owner *******************"

@mco.each do |mco|
  mn = mco.members_in_courses.where(:owner => true).count
  puts  "******************** #{mn} ********************"
  ulc =  mco.members_in_courses.count
  if ulc != 0
    puts "curso con usuarios"
    puts ulc
  
  if mn == 0
    puts "este curso no tiene owner"
    own = mco.members_in_courses.first
    puts own
    puts own.owner
    
    user = User.find(own.user_id)
    #############  atrapando el primer role del usuario ###########
    pol = user.permissionings.first  
    puts pol.role_id
    
    if own.owner == false
      if pol.role_id == 1
      own.owner == true
      own.save
      puts "se ha agregado el owner exitosamente al curso"
      end
      if pol.role_id == 3
      own.owner == true
      own.save
      puts "se ha agregado el owner exitosamente al curso"
      end
    end
    
    if own.owner == nil
        if pol.role_id == 1
        own.owner == true
        own.save
        puts "se ha agregado el owner exitosamente al curso"
        end
        if pol.role_id == 3
        own.owner == true
        own.save
        puts "se ha agregado el owner exitosamente al curso"
        end
    end
    
  else
    puts "este curso  tiene owner"
    own = mco.members_in_courses.first
    puts own
    puts own.owner
  end
  
  else
    puts "este curso no tiene ningun usuario y sera eliminado"
    puts ulc
    mco.destroy
  end
  
  
end




end