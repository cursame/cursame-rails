task :prezi_update => :environment do
   @comments = Comment.all
   @deliverys = Delivery.all
   @discussions = Discussion.all
   @assignments = Assignment.all
   
  @comments.each do |co|
    @chant = co.comment 
    puts @chant
    co.comment_html == @chant
    puts co.comment_html
    co.save
  end
  
  @deliverys.each do |del|
    @chant_del = del.description 
    del.description_html == @chant_del
    del.save
  end
  
  @discussions.each do |dis|
    @chant_dis = dis.description 
    dis.description_html == @chant_del
    dis.save
  end
  
  @assignments.each do |ass|
     @chant_ass = ass.brief_description 
     ass.brief_description_html == @chant_ass
     ass.save
   end
  
  
  
   
end