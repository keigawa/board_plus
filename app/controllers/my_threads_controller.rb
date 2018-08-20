class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: [:show, :edit, :update, :destroy]

  def index
    @my_threads=MyThread.all
  end

  def create
    @my_thread = MyThread.create(my_thread_params)
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
    @my_thread.update(my_thread_params)
    redirect_to @my_thread
  end

  def destroy
    @my_thread.destroy
    redirect_to my_threads_path
  end

  private
  def set_my_thread
    @my_thread=MyThread.find(params[:id])
  end

  def my_thread_params
    params.require(:my_thread).permit(:title)
  end
end
