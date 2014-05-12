class ModalController < ApplicationController
    skip_before_filter :authenticate_user!, :only => []

  def network_intro_video_modal
     respond_to do |format|
        format.js
     end
  end

  def teacher_quiz_modal
     respond_to do |format|
        format.js
     end
  end 

  def student_quiz_modal
     respond_to do |format|
        format.js
     end
  end 

  def set_password_modal
     respond_to do |format|
        format.js
     end
  end

end