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
        
        case type
          when 'Comment'
            publication = Comment.find(id)
            case publication.commentable_type
              when 'Course'
                auxtext = 'en el curso de #{publication.commentable.title}'
              when 'Network'
                auxtext = 'en la red'
            end            
            text = '#{publication.user.name} ha comentado #{auxtext}'
            avatar = publication.user.avatar.blank? ? publication.user.avatar.profile : publication.user.image_avatarx
          when 'Discussion'
            publication = Discussion.find(id)
            auxtext = publication.courses.empty? ? 'publica en tu red' : 'en el curso de #{publication.courses[0].title}'
            text = 'Se ha creado un discusion #{auxtext} '
            avatar = publication.user.avatar.blank? ? publication.user.avatar.profile : publication.user.image_avatarx
          when 'Course'
            publication = Course.find(id)
            text = 'Nuevo curso en tu #{publication.title}'
            avatar = publication.avatar.blank? ? publication.avatar.profile : publication.image_avatarx
          when 'Delivery'
            publication = Delivery.find(id)
            text = 'Se ha creado una tarea en el curso de #{publication.courses[0].title}'
            avatar = publication.courses[0].avatar.blank? ? publication.courses[0].avatar.profile : publication.courses[0].image_avatarx
          when 'Survey'
            publication = Survey.find(id)
            text = 'Se ha creado un cuestionario en el curso de #{publication.courses[0].title}'
            avatar = publication.courses[0].avatar.blank? ? publication.courses[0].avatar.profile : publication.courses[0].image_avatarx
        end
        # publication.likes = publication.likes.size
       
        pub = {
          type: type,
          publicationId: id,
          text: text,
          avatar:avatar,
          createdAt: publication.created_at
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
    # if params[:commentable_type] == "Delivery" && @user.roles.last.id == 2
    #   @comments = @comments = Comment.where("commentable_type" => params[:commentable_type],"user_id" => @user.id ,"commentable_id" => params[:commentable_id]).order('created_at ASC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    # end
    render :json => {:comments => @comments.as_json(:include => [:user, :comments]) , :count => @comments.count()}, :callback => params[:callback]
  end

  def courses
    @ids = []
    # si es admin de la red se le muestran todos los cursos
    if @user.roles.last.id == 1
      @courses = @network.courses.order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    else
      @courses = @user.courses.includes(:members_in_courses).where("members_in_courses.accepted = ?",true).order('created_at DESC').paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    end
    render :json => {:courses => @courses.as_json(:include => [:members_in_courses]), :count => @courses.count()}, :callback => params[:callback]
  end

  def users
    @users = @network.users.paginate(:per_page => params[:limit].to_i, :page => params[:page].to_i)
    render :json => {:users => @users.as_json, :count => @users.count()}, :callback => params[:callback]
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
    render :json => {:assignments => assignments.as_json(:include => [:user])}, :callback => params[:callback]
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

  private
  def authorize
    @user=User.find_by_authentication_token(params[:auth_token])
    @network = @user.networks[0]
    if @user.nil?
      logger.info("Token not found.")
      render :status => 200, :json => {:message => "Invalid token", :success => false}
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
end
