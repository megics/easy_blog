class Hq::CommentsController < ApplicationController
  layout 'hq/application'
  before_action :set_comment, only: [:show, :destroy]
  add_breadcrumb "Yorumlar", :hq_comments_path

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    add_breadcrumb @comment.body, hq_comment_path(@comment)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(:hq, @comment, location:request.referer)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
