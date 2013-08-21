task :cleaner_inconsistences => :environment do
@d = Delivery.all
@s = Survey.all
@n = Notification.all
@a = Assignment.all
@f = Friendship.all
@c = Comment.all


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


end