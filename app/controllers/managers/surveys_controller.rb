class Managers::SurveysController < Managers::BaseController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find_by_id params[:id]
  end

  def destroy
    @survey = Survey.find params[:id]
    @survey.destroy
    
    redirect_to managers_surveys_path, flash: { success: 'Cuestionario borrado correctamente.' }
  end
end
