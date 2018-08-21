class MyThreads::CommentsController < ApplicationController
  before_action :set_my_thread 
<<<<<<< HEAD
  before_action :set_comment_admin, only: [:update, :destroy]
=======
  before_action :set_comment, only: [:edit, :update, :destroy] 
  before_action :set_user_id_authentic, only: [:update, :destroy]
>>>>>>> 7b348ea57a85abe1e26e92419887ab2b04459976

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
    if @user_id_authentic==current_user.id
    @comment.update(comment_params)
    end
    redirect_to my_thread_comments_path(my_thread_id: @my_thread)
  end

  def destroy
    if @user_id_authentic==current_user.id
    @comment.destroy
    end
    redirect_to my_thread_comments_path(my_thread_id: @my_thread)
  end

  private
  def set_my_thread
    @my_thread=MyThread.find(params[:my_thread_id])
  end

  def set_comment_admin
    @comment=Comment.find_by!(id: params[:id], user_id: current_user.id)
  end

  def set_user_id_authentic
    @user_id_authentic=@comment.user_id
  end
  
  def set_user_id_authentic
    @user_id_authentic=@comment.user_id
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end


