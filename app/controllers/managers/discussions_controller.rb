# -*- coding: utf-8 -*-
class Managers::DiscussionsController < Managers::BaseController
  def index
    @discussions = current_network.discussions.paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
  end

  def show
    @discussion = Discussion.find_by_id(params[:id])
  end

  def destroy
    discussion = Discussion.find_by_id(params[:id])
    discussion.destroy
    redirect_to managers_discussions_path, flash: { success: t('managers.delete_discuss') }
  end
end
