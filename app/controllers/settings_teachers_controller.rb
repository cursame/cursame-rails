class SettingsTeachersController < ApplicationController
  # GET /settings_teachers
  # GET /settings_teachers.json
  def index
    @settings_teachers = SettingsTeacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @settings_teachers }
    end
  end

  # GET /settings_teachers/1
  # GET /settings_teachers/1.json
  def show
    @settings_teacher = SettingsTeacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @settings_teacher }
    end
  end

  # GET /settings_teachers/new
  # GET /settings_teachers/new.json
  def new
    @settings_teacher = SettingsTeacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @settings_teacher }
    end
  end

  # GET /settings_teachers/1/edit
  def edit
    @settings_teacher = SettingsTeacher.find(params[:id])
  end

  # POST /settings_teachers
  # POST /settings_teachers.json
  def create
    @settings_teacher = SettingsTeacher.new(params[:settings_teacher])

    respond_to do |format|
      if @settings_teacher.save
        format.html { redirect_to @settings_teacher, notice: 'Settings teacher was successfully created.' }
        format.json { render json: @settings_teacher, status: :created, location: @settings_teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @settings_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /settings_teachers/1
  # PUT /settings_teachers/1.json
  def update
    @settings_teacher = SettingsTeacher.find(params[:id])

    respond_to do |format|
      if @settings_teacher.update_attributes(params[:settings_teacher])
        format.html { redirect_to @settings_teacher, notice: 'Settings teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @settings_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings_teachers/1
  # DELETE /settings_teachers/1.json
  def destroy
    @settings_teacher = SettingsTeacher.find(params[:id])
    @settings_teacher.destroy

    respond_to do |format|
      format.html { redirect_to settings_teachers_url }
      format.json { head :no_content }
    end
  end
end
