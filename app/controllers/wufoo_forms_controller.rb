class WufooFormsController < ApplicationController
  def create
    wufoo_form_params = params[:wufoo_form]
    @form = WufooForm.create(wufoo_form_params)
  end
end
