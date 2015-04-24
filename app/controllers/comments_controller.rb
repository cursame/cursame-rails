# coding: utf-8

class CommentsController < ApplicationController
  include CoursesUtils
  before_filter :validations, only: :show

  def show
    @wall = Wall.find_by_publication_type_and_publication_id( 'Comment', @comment.id )
  end

  # def validations
  #   @comment = Comment.find_by_id(params[:id]) 
  #   redirect_to root_path, flash: { error: "El comentario que intentas ver no existe o ha sido borrado."} and return if @comment.nil?
  #   course_member?(current_user, @comment.commentable)
  # end

  def validations
    @comment = Comment.find_by_id(params[:id]) 
    redirect_to root_path, flash: { error: t('.comments.no_exist')} and return if @comment.nil?
    if @comment.commentable == Course
      course_member?(current_user, @comment.commentable)
    end
  end
end