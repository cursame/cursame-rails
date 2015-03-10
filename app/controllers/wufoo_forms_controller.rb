class WufooFormsController < ApplicationController
  def create
    @publication = walls create_forms(params)
  end

  def entry
    wufoo_form = WufooForm.find_by_id params[:id]
    wufoo_params = wufoo_form_params(params)
    response = submit_wufoo_form(wufoo_form.form, wufoo_params)
    if response && response["Success"] == 1 # success
      WufooResponse.create({ wufoo_form: wufoo_form, user: current_user })
    end
  end

  private
  def create_forms(params)
    if params[:delivery].nil? || params[:delivery][:course_ids].blank?
      create_network_wufoo_forms(params)
    else
      create_course_wufoo_forms(params)
    end
  end

  def create_network_wufoo_forms(params)
    [ create_wufoo_form(params, current_network) ]
  end

  def create_course_wufoo_forms(params)
    params[:delivery][:course_ids].map do |id|
      create_wufoo_form params, Course.find_by_id(id)
    end
  end

  def create_wufoo_form(params, showable)
    WufooForm.create params[:wufoo_form] do |f|
      f.showable = showable
      f.user = current_user
    end
  end

  def submit_wufoo_form(form, params)
    form.submit(params)
  end

  def wufoo_form_params(params)
    params.reject do |param|
      [ 'locale', 'utf8', 'wufoo_form_id', 'commit', 'controller', 'action'].include? param
    end
  end

  def walls(wufoo_forms)
    wufoo_forms.map { |form| Wall.find_by_publication_id_and_publication_type form.id, form.class.name }
  end
end
