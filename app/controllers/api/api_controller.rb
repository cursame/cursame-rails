class Api::ApiController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  before_filter :authorize

  respond_to :json

  def publications
    case params[:type]
      when 'Course'
        @course = Course.find(params[:publicacionId])
        @publications = @course.walls.where("publication_type != ?", 'Course')
        @publications = @publications.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
      else
        @publications = @network.publications(@user.id,@network.id).paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    end
      @publications.each do |publication|
        type = publication.publication_type
        id = publication.publication_id
        case type
          when 'Comment'
            publication = Comment.find(id)
          when 'Discussion'
            publication = Discussion.find(id)
          when 'Course'
            publication = Course.find(id)
          when 'Delivery'
            publication = Delivery.find(id)
        end
        # publication.likes = publication.likes.size
      end
    render :json => {:publications => @publications.as_json(:include => [{:publication => {:include => [:comments, :user]}}, :users, :courses, :network]), :count => @publications.count()}, :callback => params[:callback]
  end

  def native_publications
    case params[:type]
      when 'Course'
        @course = Course.find(params[:publicacionId])
        @publications = @course.walls.where("publication_type != ?", 'Course')
        @publications = @publications.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
      else
        @publications = @network.publications(@user.id,@network.id).paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    end
      @pubs = []
      @publications.each do |publication|
        type = publication.publication_type
        id = publication.publication_id
        created_at = publication.created_at
        
        done = true
        
        case type
          when 'Comment'
            publication = Comment.find(id)
            case publication.commentable_type
              when 'Course'
                auxtext = 'en la asignatura de ' + publication.commentable.title
              when 'Network'
                auxtext = 'en la red '
              when 'User'
                auxtext = 'en tu prefil '
            end 

            text = publication.user.name + ' ha comentado ' + auxtext
            avatar =  {
              url: publication.user.avatar.url.nil? ? "/assets/" + publication.user.image_avatarx : publication.user.avatar.url 
            }
          when 'Discussion'
            publication = Discussion.find(id)
            comments = publication.comments
            auxtext = publication.courses.empty? ? 'publica en tu red' : 'en la asignatura de ' + publication.courses[0].title
            text = 'Se ha creado un discusion ' + auxtext
            avatar =  {
              url: publication.user.avatar.url.nil? ? "/assets/" + publication.user.image_avatarx : publication.user.avatar.url 
            }
          when 'Course'
            publication = Course.find(id)
            comments = publication.comments
            text = 'Nueva asignatura ' + publication.title
            avatar =  {
              url: publication.avatar.url.nil? ? "/assets/" + publication.course_avatarx : publication.avatar.url 
            }
          when 'Delivery'
            publication = Delivery.find(id)
            comments = publication.comments
            done = !Assignment.where(:delivery_id => id, :user_id => @user.id).empty?
            text = 'Se ha creado una tarea en la asignatura de ' + publication.courses[0].title
            avatar =  {
              url: publication.courses[0].avatar.url.nil? ? "/assets/" + publication.courses[0].course_avatarx : publication.courses[0].avatar.url 
            }
            publication = publication.as_json(:include => [:areas_of_evaluations,:assets])
          when 'Survey'
            publication = Survey.find(id)
            comments = publication.comments
            done = !UserSurvey.where(:survey_id => id, :user_id => @user.id).empty?
            text = 'Se ha creado un cuestionario en la asignatura de ' + publication.courses[0].title
            avatar =  {
              url: publication.courses[0].avatar.url.nil? ? "/assets/" + publication.courses[0].course_avatarx : publication.courses[0].avatar.url 
            }
            publication = publication.as_json(:include => [{:questions => {:include => [:answers]}}])
        end
        # publication.likes = publication.likes.size
       
        pub = {
          type: type,
          publicationId: id,
          text: text,
          avatar:avatar,
          publication:publication,
          createdAt: created_at,
          done: done,
          comments: comments,
          num_comments: comments.nil? ? 0 : comments.count
        }
       @pubs.push(pub)
      end
    # render :json => {:publications => @publications.as_json(:include => [{:publication => {:include => [:comments, :user]}}, :users, :courses, :network]), :count => @publications.count()}, :callback => params[:callback]
    render :json => {:publications => @pubs.as_json, :count => @pubs.count()}, :callback => params[:callback]
  end


  def comments
    @comments = Comment.where("commentable_type" => params[:commentable_type], "commentable_id" => params[:commentable_id]).order('created_at ASC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)

    @comments.each do |comment|
      comment.likes = comment.likes.size
    end
    render :json => {:comments => @comments.as_json(:include => [:user, :comments]) , :count => @comments.count()}, :callback => params[:callback]
  end

  def courses
    @ids = []
    # si es admin de la red se le muestran todos los asignaturas
    # if @user.roles.last.id == 1
    #   @courses = @network.courses.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    # else
    #   @courses = @network.courses.includes(:members_in_courses).where("members_in_courses.accepted = ?",true).order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    # end
    @courses = @network.courses.includes(:members_in_courses).order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    render :json => {:courses => @courses.as_json(:include => [:members_in_courses]), :count => @courses.count()}, :callback => params[:callback]
  end

  def users
    @users = @network.users.paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    
    @usuarios = []
    @users.each do |u|
      uu = {
        accepted_terms: u.accepted_terms,
        avatar: {
          url: u.avatar.url.nil? ? "/assets/" + u.image_avatarx : u.avatar.url, 
        },
        bios: u.bios,
        coverphoto: u.coverphoto,
        created_at: u.created_at,
        description: u.description,
        domain: u.domain,
        email: u.email,
        facebook_link: u.facebook_link,
        first_name: u.first_name,
        id: u.id,
        last_name: u.last_name,
        personal_url: u.personal_url,
        subdomain: u.subdomain,
        tour_info: u.tour_info,
        twitter_link: u.twitter_link,
        updated_at: u.updated_at
      }
      @usuarios.push(uu)
    end
    render :json => {:users => @usuarios.as_json, :count => @usuarios.count()}, :callback => params[:callback]
  end

  def notifications
    notifications = @user.notifications.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    @num_notifications = notifications.count()

    @user_notifications = Array.new
    notifications.each do |notification|
      user = @user
      owner = nil
      notificator = notification.notificator
      case notification.kind
        when 'user_comment_on_network'
          cretator = notification.notificator.user
          owner = notification.notificator.commentable
        when 'user_comment_on_course'
          cretator = notification.notificator.user
          owner = notification.notificator.commentable
          course = Course.find(notification.notificator.commentable_id)
        when 'new_delivery_on_course'
          cretator = notification.notificator.user
          owner = notification.notificator.courses[0]
          course = owner
        when 'new_public_course_on_network'
          cretator = notification.notificator.user
        # when 'new_survey_on_course'
        when 'user_comment_on_comment'
          cretator = notification.notificator.user
          owner = notification.notificator.commentable
        when 'user_comment_on_user'
          cretator = notification.notificator.user
          owner = notification.notificator.commentable
        when 'user_comment_on_discussion'
          cretator = notification.notificator.user
          owner = notification.notificator.commentable
        when 'user_comment_on_delivery'
          cretator = notification.notificator.user
          owner = notification.notificator.commentable
      end
      notification.notificator_type = {
          :creator => cretator,
          :course => course,
          :notificator => notificator,
          :user => user,
          :owner => owner
      }
      
      @user_notifications.push(notification)
      notification_to_save = Notification.find(notification.id)
      notification_to_save.active = false ##para identificar las notificaciones vistas
      notification_to_save.save
    end
    #
    # @notifications = @user.notifications.includes(:notificator)
    render :json => {:notifications => @user_notifications.as_json, :num_notifications => @num_notifications}, :callback => params[:callback]
  end

  def assignments
    assignments = Assignment.where("delivery_id" => params[:delivery_id])
    render :json => {:assignments => assignments.as_json(:include => [:user,:assets])}, :callback => params[:callback]
  end

  def create_comment
    if params[:id].to_i != 0
      @comment = Comment.find(params[:id])
    else
      @comment = Comment.new
    end
    
    @comment.commentable_type = params[:commentable_type]
    @comment.commentable_id = params[:commentable_id] || @user.id
    @comment.comment = params[:comment]
    @comment.user = @user
    @comment.network = @network
    @comment.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def create_like
    case params[:type]
      when 'Course'
        @object = Course.find(params[:id])
      when 'Comment'
        @object = Comment.find(params[:id])
      when 'Delivery'
        @object = Delivery.find(params[:id])
      when 'User'
        @object = User.find(params[:id])
      when 'Discussion'
        @object = Discussion.find(params[:id])
      when 'Survey'
        @object = Survey.find(params[:id])
    end

    if is_liked_by_current_user(@object)
      @object.disliked_by @user
    else
      @object.liked_by @user
    end
    render :json => {:success => true}, :callback => params[:callback]
  end

  def create_delivery

    @delivery = Delivery.new   
    
    @delivery.title = params[:title]
    @delivery.description = params[:description]
    @delivery.publish_date = params[:publication]
    @delivery.end_date = params[:deliver]
    @delivery.porcent_of_evaluation = params[:value]
    @delivery.user = @user
    @delivery.network = @network
    @delivery.courses.push(Course.find(params[:courseId]))

    @delivery.save
    render :json => {:success => true}, :callback => params[:callback]
  end
  
  def native_create_delivery
    if params[:id].to_i != 0
      @delivery = Delivery.find(params[:id])
    else
      @delivery = Delivery.new
    end
    @delivery.title = params[:title]
    @delivery.description = params[:description]
    @delivery.publish_date = params[:publication]
    @delivery.end_date = params[:deliver]
    @delivery.porcent_of_evaluation = params[:value]
    @delivery.user = @user
    @delivery.network = @network
    @delivery.courses.push(Course.find(params[:courseId]))

    
    # agregamos los files
    files = params[:files]
    areas = params[:areas]
    
    if files && files.kind_of?(Array) && !files.empty?
      files.each do |file|
        asset = Asset.new()
        asset.file = file[1]
        asset.user_id = @user.id
        asset.save
        @delivery.assets.push(asset)
      end
    elsif files
        asset = Asset.new()
        asset.file = params[:files]
        asset.user_id = @user.id
        asset.save
        @delivery.assets.push(asset)
    end

    if areas && !areas.empty?
      areas.each do |area|
        a = AreasOfEvaluation.new()
        a.evaluation_percentage = area[1]['percentage']
        a.name = area[1]['name']
        a.save
        @delivery.areas_of_evaluations.push(a)
      end
    end

    # guardamos la tarea
    @delivery.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def create_discussion
    if params[:id].to_i != 0
      @discussion = Discussion.find(params[:id])
    else
      @discussion = Discussion.new
    end
    
    @discussion.title = params[:title]
    @discussion.description = params[:discussion]
    @discussion.user = @user
    @discussion.network = @network
    @discussion.courses.push(Course.find(params[:courseId]))

    @discussion.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def delete
    element = eval(params[:type]).find(params[:id])
    element.destroy
    render :json => {:success => true}, :callback => params[:callback]
  end

  def assigment_delivery
    @assignment = Assignment.new()
    course_id = DeliveriesCourse.find_by_delivery_id(params[:deliveryId]).course_id
    @assignment.course_id = course_id
    @assignment.delivery_id = params[:deliveryId]
    @assignment.title = params[:title]
    @assignment.brief_description = params[:description]
    @assignment.user_id = params[:userId]

    @assignment.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def native_assigment_delivery
    @assignment = Assignment.new()
    course_id = DeliveriesCourse.find_by_delivery_id(params[:deliveryId]).course_id
    @assignment.course_id = course_id
    @assignment.delivery_id = params[:deliveryId]
    @assignment.title = params[:title]
    @assignment.brief_description = params[:description]
    @assignment.user_id = params[:userId]
    files = params[:files]

    if files && files.kind_of?(Array) && !files.empty?
      files.each do |file|
        asset = Asset.new()
        asset.file = file[1]
        asset.user_id = @user.id
        asset.save
        @assignment.assets.push(asset)
      end
    elsif files
        asset = Asset.new()
        asset.file = params[:files]
        asset.user_id = @user.id
        asset.save
        @assignment.assets.push(asset)
    end

    @assignment.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def native_create_survey
    @survey = Survey.new(params[:survey])
    @survey.user = @user
    @survey.network = @network
    success = true

    courses = params[:delivery] ? params[:delivery]["course_ids"] : nil

    if courses && !courses.empty?
      courses.each do |id|
        @survey.courses.push(Course.find(id))
      end
      @survey.save
    else
      success = false
    end
    render :json => {:success => success}, :callback => params[:callback]
  end

  def native_change_notification_status
    @notification = Notification.find(params[:id])
    @notification.active = false
    !@notification.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def qualify_assignment
    assignment = Assignment.find(params[:assignment_id])
    assignment.rub_calification = params[:calification]
    assignment.save
    render :json => {:success => true}, :callback => params[:callback]
  end

  def native_update_user_profile
    id = params[:id]
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
    bios = params[:bios]
    twitter_link = params[:twitter_link]
    avatar = params[:avatar]
    coverphoto = params[:coverphoto]
    
    if id && email && first_name && last_name
      user = User.find(id)
      user.email = email
      # user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.bios = bios
      user.twitter_link = twitter_link

      if avatar
        user.avatar = avatar
      end

      if coverphoto
        user.coverphoto = coverphoto
      end
      
      success = user.save!
      msg = success ? "Usuario guardado!" : "Error al guardar usuario"
    else
      success= false
      msg = "Faltan campos obligatorios"
    end
    render :json => {:success => success, :msg => msg}, :callback => params[:callback]
  end

  def native_create_courses
    if params[:id].to_i != 0
      @course = Course.find(params[:id])      
      @course.update_attributes(params[:course])
      @course.network_id = @network.id
      @course.save      
    else
      @course = Course.new(params[:course])
      @course.network_id = @network.id
      @course.save
      @member = MembersInCourse.new
      @member.user_id = @user.id
      @member.course_id =  @course.id
      @member.accepted = true
      @member.owner = true
      @member.network_id = @network.id
      @member.title = @course.title
      @member.save
    end 
    render :json => {:success => true}, :callback => params[:callback]
  end
  def native_answer_survey

    @user_survey = UserSurvey.new
    @user_survey.survey_id = params[:survey_id]
    @user_survey.user = @user
    @user_survey.result = 0;

    if @user_survey.save
      params[:questions].each do |question|
          question[1].each do |answer|
            @user_response = UserSurveyResponse.new
            @user_response.user_survey_id = @user_survey.id
            @user_response.question_id = question[0]
            @user_response.answer_id = answer[1]
            @user_response.save
          end
      end
    end
    render :json => {:success => true}, :callback => params[:callback]
  end

  #checar la respuesta
  def native_comments
    @cmts = []
    @comments = Comment.where("commentable_type" => params[:commentable_type], "commentable_id" => params[:commentable_id]).order('created_at ASC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    

    @comments.each do |comment|
      type = comment.commentable_type
      text = 'Comentario de ' + comment.user.name
      case type
        when 'Course'
          text =  text + ' en la asignatura ' + comment.commentable.title
        when 'User'
          text =  text + ' para ' + comment.commentable.name
        when 'Comment'
          text =  text + ' en el comentario de ' + comment.commentable.user.name
        when 'Network'
          text =  text + ' en la red' + comment.commentable.name
        when 'Delivery'
          text =  text + ' en la tarea ' + comment.commentable.title
        when 'Group'
          text =  text + ' en el grupo ' + comment.commentable.name
        when 'Discussion'
          text =  text + ' en la discusion ' + comment.commentable.title
        when 'Survey'
          text =  text + ' en el cuestionario ' + comment.commentable.name
      end

       u = comment.user
       cmt = {
          id: comment.id,
          title: comment.title,
          comment: comment.comment,
          commentable_id: comment.commentable_id,
          commentable_type: comment.commentable_type,
          user_id: comment.user_id,
          role: comment.role,
          created_at: comment.created_at,
          updated_at: comment.updated_at,
          comment_html: comment.comment_html,
          network_id: comment.network_id,
          num_likes: comment.likes.size,   
          likes: comment.likes,   
          text: text,
          avatar: {
            url: u.avatar.url.nil? ? "/assets/" + u.image_avatarx : u.avatar.url, 
          },
          num_comments: comment.comments.count
        }
      @cmts.push(cmt)     
    end
    render :json => {:comments => @cmts.as_json, :count => @cmts.count()}, :callback => params[:callback]
  end

  def native_list_members_in_course
    course =  Course.find(params[:id])
    @members = course.members_in_courses.paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    @users = []
    @members.each do |m|
      u = m.user
      user = {
        id: u.id, 
        email: u.email,
        first_name: u.first_name,
        last_name: u.last_name, 
        description: u.description, 
        personal_url: u.personal_url, 
        avatar: {
          url: u.avatar.url.nil? ? "/assets/" + u.image_avatarx : u.avatar.url, 
        }, 
        coverphoto: u.coverphoto.url, 
        facebook_link: u.facebook_link,
        twitter_link: u.twitter_link,
        bios: u.bios,
        tour_info: u.tour_info,
        accepted_terms: u.accepted_terms,
        subdomain: u.subdomain,
        domain: u.domain,
        accepted: m.accepted
      }
      @users.push(user)
    end
    render :json => {:users => @users.as_json, :count => @users.count()}, :callback => params[:callback]
  end

  def native_change_members_in_course_status      
      @course =  Course.find(params[:id])
      @requester =  User.find(params[:user_id])
      success = false

      case params[:status]
        when 'join'
          member = MembersInCourse.new
          member.user_id = @requester.id
          member.course_id =  @course.id
          member.accepted = false
          member.owner = (params[:owner] && params[:owner] == 'true') ? true : false 
          member.network_id = @network.id
          member.title = @course.title
          success = member.save
        when 'accept'
          member = MembersInCourse.where(:user_id => @requester.id, :course_id => @course.id)[0]
          if member
            member.owner = (params[:owner] && params[:owner] == 'true') ? true : false 
            member.accepted = true
            success = member.save
          end     
        when 'decline'          
          member = MembersInCourse.where(:user_id => @requester.id, :course_id => @course.id)[0]
          if member
            success = !!member.delete
          end
      end      
      render :json => {:success => success}, :callback => params[:callback]
  end
  
  def native_add_new_message
    @channel = Channel.find_by_channel_name(params[:channel_name])

    if !@channel
      @channel = Channel.create!(:channel_name=>params[:channel_name],:channel_type => "")
    end

    @message = Mesage.create!(:mesage => params[:mesage],:user_id =>@user.id,:channel_id =>@channel.id)
    render :json => {:success => true}, :callback => params[:callback]
  end

  def native_chat_list
    friends_online = @user.friends(true)
    courses_online = @user.courses

    @list = []

    courses_online.each do |c|
      item = {
        name:c.title,
        channel_name: "/messages/course_channel_"+ c.id.to_s,
        type: 'course',
        avatar: {
          url: c.avatar.url.nil? ? "/assets/" + c.course_avatarx : c.avatar.url
        }
      }
      @list.push(item)
    end
    friends_online.each do |u|
      item = {
        name:u.name,
        channel_name: get_unique_channel_users([@user.id,u.id]),
        type: 'user',
        avatar: {
          url: u.avatar.url.nil? ? "/assets/" + u.image_avatarx : u.avatar.url
        }
      }
      @list.push(item)
    end    
    render :json => {:users => @list.as_json, :count => @list.count()}, :callback => params[:callback]
  end

  def native_load_chat_messages    
    ids = params['channel_name'].split(/_/);
    users = []
    @messages = []
    if ids.length == 3 #se trata de un curso
      users = Course.find(ids[2]).users
    end
    if ids.length > 3 #se trata de chat entre usuarios
      ids.each_with_index do |id,index|
        if index > 2
          users.push(User.find(id))
        end
      end
    end
    channel = find_or_insert_channel(params['channel_name'],users)
    msgs = channel.mesages.paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i).order('created_at DESC')
    
    msgs.each do |message|
      msg = {
        channel_id: message.channel_id,
        created_at: message.created_at,
        id: message.id,
        mesage: message.mesage,
        mesage_html: message.mesage_html,
        updated_at: message.updated_at,
        user_id: message.user_id,
        user: message.user,
        avatar: {
            url: message.user.avatar.url.nil? ? "/assets/" + message.user.image_avatarx : message.user.avatar.url, 
        },
      }
      @messages.push(msg)
    end 

    render :json => {:messages => @messages.as_json, :count => @messages.count()}, :callback => params[:callback]
  end

  def native_list_user_calification
    user = User.find(params[:id])

    @results = []
    user.user_surveys.each do |us|
      us.evaluation
      puts us.to_yaml
      r = {
        result: us.result,
        name: us.survey.name,
        type: 'Survey'
      }
      @results.push(r)
    end
    user.assignments.each do |as|
      if as.delivery.nil?
        next
      end
      r = {
        result: as.accomplishment,
        name: as.delivery.title,
        type: 'Delivery'
      }
      @results.push(r)
    end
    render :json => {:results => @results.as_json, :count => @results.count()}, :callback => params[:callback]
  end

  def native_list_events    
    @events = @user.events.where("strftime('%Y-%m', starts_at) = ?", params[:date]).order('created_at DESC')
    render :json => {:results => @events.as_json, :count => @events.count()}, :callback => params[:callback]
  end

  def native_list_activities_of_course
    course = Course.find(params[:id])
    @pubs = []
    publications = course.walls

    publications.each do |publication|
        type = publication.publication_type
        id = publication.publication_id
        created_at = publication.created_at

        case type          
          when 'Delivery'
            publication = Delivery.find(id)
            text = 'Se ha creado una tarea en la asignatura de ' + course.title
            avatar =  {
              url: course.avatar.url.nil? ? "/assets/" + course.course_avatarx : course.avatar.url 
            }
            publication = publication.as_json(:include => [{:assignments => {:include => [:assets]}},:assets])
          when 'Survey'
            publication = Survey.find(id)
            text = 'Se ha creado un cuestionario en la asignatura de ' + course.title
            avatar =  {
              url: course.avatar.url.nil? ? "/assets/" + course.course_avatarx : course.avatar.url 
            }
            publication = publication.as_json(:include => [{:user_surveys => {:include => [:user]}}])
          else
            next
        end
       
        pub = {
          type: type,
          publicationId: id,
          text: text,
          avatar:avatar,
          publication:publication,
          createdAt: created_at
        }
       @pubs.push(pub)
      end    
    render :json => {:results => @pubs.as_json, :count => @pubs.count()}, :callback => params[:callback]
  end

  private
  def authorize
    @user = User.find_by_authentication_token(params[:auth_token])
    if @user.nil?
      logger.info("Token not found.")
      render :status => 200, :json => {:message => "Invalid token", :success => false}
    else
      @network = @user.networks[0]
    end
  end

  def is_liked_by_current_user(object)
    @bandera = false
    object.likes.each do |like|
      if like.voter_id == @user.id
        @bandera = true
      end
    end
    return @bandera
  end

  def get_unique_channel_users(ids)
    ids = ids.sort
    channel_name = "/messages/users_channel_"+ (ids * "_")
    return channel_name
  end

  def find_or_insert_channel(channel_name,users)
    channel = Channel.find_by_channel_name(channel_name)
    if !channel
      channel = Channel.create!(:channel_name=>channel_name,:channel_type => "")
      channel.users = users
      channel.save!
    end
    return channel
  end
end
