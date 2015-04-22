class Managers::ReportedContentsController < Managers::BaseController
  def index
    @reported_contents = current_network.reported_contents.paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
  end

  def show
    @reported_content = ReportedContent.find_by_id(params[:id])
  end

  def destroy
    reported_content = ReportedContent.find_by_id(params[:id])
    reported_content.destroy
    the_flash = { success: t('.managers.delete_report') }
    redirect_to managers_reported_contents_path, flash: the_flash
  end

  def destroy_content
    reported_content = ReportedContent.find_by_id(params[:id])
    content = reported_content.reportable
    content.destroy
    the_flash = { success: t('.managers.delete_content') }
    redirect_to managers_reported_contents_path, flash: the_flash
  end
end
