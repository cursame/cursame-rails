# encoding: UTF-8
class Managers::CommentsController < Managers::BaseController
  def index
    @comments = Comment.all.paginate(:per_page => 30, :page => 1)
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy if !comment.nil? && comment.network == current_network
    redirect_to managers_comments_path, flash: Comment.exists?(comment) ? { error: 'Ocurrió un error al borrar el comentario' } : { success: 'Comentario borrado correctamente' }
  end
end