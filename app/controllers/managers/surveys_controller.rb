class Managers::SurveysController < Managers::BaseController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find_by_id params[:id]
  end

  def destroy
    redirect_to managers_surveys_path, flash: { success: 'Cuestionario borrada correctamente.' }
  end
end
