class Managers::CommentsController < Managers::BaseController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by_id params[:id]
  end

  def destroy
    redirect_to managers_comments_path, flash: { success: 'Comentario borrado correctamente.' }
  end
end