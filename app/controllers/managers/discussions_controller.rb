# -*- coding: utf-8 -*-
class Managers::DiscussionsController < Managers::BaseController
  def index
    @discussions = current_network.discussions
  end

  def show
    @discussion = Discussion.find_by_id(params[:id])
  end

  def destroy
    discussion = Discussion.find_by_id(params[:id])
    discussion.destroy
    redirect_to managers_discussions_path, flash: { success: 'Discusión borrada correctamente.' }
  end
end
