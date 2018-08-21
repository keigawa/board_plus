class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: [:show, :edit, :update, :destroy]
  before_action :set_user_id_authentic, only: [:show, :update, :destroy]
  before_action :set_current_user_id, only: [:index, :show]
  def index
    @my_threads=MyThread.all
  end

  def create
    MyThread.create(my_thread_params.merge(user_id: current_user.id))
    redirect_to my_threads_path
  end

  def new
    @my_thread=MyThread.new
  end

  def edit
  end

  def show
    
  end

  def update
    if @user_id_authentic==current_user.id
    @my_thread.update(my_thread_params)
    end
    redirect_to @my_thread
  end

  def destroy
    if @user_id_authentic==current_user.id
    @my_thread.destroy
    end
    redirect_to my_threads_path
  end

  private
  def set_my_thread
    @my_thread=MyThread.find(params[:id])
  end

  def set_user_id_authentic
    @user_id_authentic=@my_thread.user_id
  end

  def set_current_user_id
    @current_user_id=current_user.id
  end

  def my_thread_params
    params.require(:my_thread).permit(:title)
  end
end
