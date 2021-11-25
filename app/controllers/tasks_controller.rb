class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params())
    @category = Category.find(category_params())
    @task.category = @category
    if @task.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js {}
        flash[:notice] = "Task created"
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # redirect_to tasks_path
    flash[:notice] = "Task edited"
    
    # ******************

    if @task.update
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js {}
        flash[:notice] = "Task created"
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
    # ******************

  end

  def index
    @tasks = Task.all
  end

  def destroy
    puts (params)
    @task = Task.find(params[:id])
    puts (@task)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
    @task.destroy

    flash[:notice] = "Task delete"
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
