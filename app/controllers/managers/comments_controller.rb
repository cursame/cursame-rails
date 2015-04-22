# encoding: UTF-8
class Managers::CommentsController < Managers::BaseController
  def index
    @comments = current_network.comments.paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
    # @comments = Comment.find_all_by_network_id(current_network.id).paginate(per_page: MANAGERS_RECORDS_PER_PAGE, page: params[:page])
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy if !comment.nil? && comment.network == current_network
    redirect_to managers_comments_path, flash: Comment.exists?(comment) ? { error: t('.managers.delete_error') } : { success: t('.managers.correct_deleted') }
  end
end