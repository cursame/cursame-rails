# -*- coding: utf-8 -*-
class Managers::SurveysController < Managers::BaseController
  def index
    @surveys = current_network.surveys.paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
  end

  def show
    @survey = Survey.find_by_id(params[:id])
  end

  def destroy
    survey = Survey.find_by_id(params[:id])
    survey.destroy
    redirect_to managers_surveys_path, flash: { success: t('.managers.delete_test') }
  end
end
