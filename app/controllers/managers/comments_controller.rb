class Managers::CommentsController < Managers::BaseController
  def index
    @comments = Comment.all.paginate(:per_page => 30, :page => 1)
  end

  def show
    @comment = Comment.find_by_id params[:id]
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy

    redirect_to managers_comments_path, flash: { success: 'Comentario borrado correctamente.' }
  end
end