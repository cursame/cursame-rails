class GoogleFormsController < ApplicationController
  def create
    @publication = walls(create_forms)
  end

  def update
  end

  private
  def create_forms
    if params[:google_form].nil? || params[:google_form][:course_ids].blank?
      create_network_forms
    else
      create_course_forms
    end
  end

  def create_network_forms
    [ create_form(current_network) ]
  end

  def create_course_forms
    params[:google_form][:course_ids].map do |id|
      create_form(Course.find_by_id(id))
    end
  end

  def create_form(pollable)
    GoogleForm.create(params[:google_form].except(:course_ids)) do |f|
      f.pollable = pollable
      f.user = current_user
      if params[:phase]
        f.phase_id = params[:phase].first
      end
    end
  end

  def walls(forms)
    forms.map { |form| Wall.find_by_publication_id_and_publication_type(form.id, form.class.name) }
  end
end
