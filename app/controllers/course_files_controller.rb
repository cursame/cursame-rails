class CourseFilesController < ApplicationController

  def new
    @course_file = CourseFile.new
  end

  def create
    @course_file = CourseFile.new(params[:course_file])
    @course_id = params[:course_id]
    if @course_file.save

    @cf_ui =  CourseFileIdUserId.create(:user_id => current_user.id, :course_file_id => @course_file.id )
    @cf_ci =  CourseIdCourseFileId.create(:course_id => @course_id, :course_file_id => @course_file.id )
 
    end
    @file = "#{@course_file.file}"
    @split_name =  @file.split('/').last
    @termination = @file.split('.').last
    ###### homogenizacion de variables
    @cf = @course_file
    @name = @file
    @sintetic_name = @split_name
    ##### encontrando al owner del curso
    @member = MembersInCourse.find_by_course_id_and_user_id(@course_id, current_user.id)

    @course_files = Course.find(@course_id).course_files
    @course= Course.find_by_id(@course_id)

    respond_to do |format|
      format.js
    end
  end

  def destroy
      @course_file = CourseFile.find(params[:id])
      @course = params[:course]
      @file = "#{@course_file.file}"
      @split_name =  @file.split('/').last
      @termination = @file.split('.').last
      ###### homogenizacion de variables
      @cf = @course_file
      @name = @file
      @sintetic_name = @split_name

      @course_files = Course.find(@course).course_files

      @course_file.destroy
    respond_to do |format|
      format.js
    end
  end
end
