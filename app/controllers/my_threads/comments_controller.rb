class MyThreads::CommentsController < ApplicationController
  before_action :set_my_thread 
  before_action :set_comment_admin, only: [:update, :destroy]

  def index
    @comments=Comment.where(my_thread_id:params[:my_thread_id])
    @current_user_id=current_user.id
  end

  def new
    @comment=@my_thread.comments.new
  end

  def create
    @my_thread.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to my_thread_comments_path(@my_thread)
  end

  def edit
    @comment=Comment.find(params[:id])
  end

  def update
    @comment.update(comment_params)
    redirect_to my_thread_comments_path(my_thread_id: @my_thread)
  end

  def destroy
    @comment.destroy
    redirect_to my_thread_comments_path(my_thread_id: @my_thread)
  end

  private
  def set_my_thread
    @my_thread=MyThread.find(params[:my_thread_id])
  end

  def set_comment_admin
    @comment=Comment.find_by!(id: params[:id], user_id: current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end


