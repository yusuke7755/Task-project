class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :login_required, only:[:index, :new, :show, :edit, :update, :destroy]
  before_action :login_require

  PER = 5
  # GET /tasks or /tasks.json
  def index
    
    @tasks = current_user.tasks
    if params[:sort_expired]
			@tasks = @tasks.order(deadline: :desc).page(params[:page]).per(PER)
    elsif params[:sort_priority_high]
      @tasks = @tasks.order(priority: :asc).page(params[:page]).per(PER)
    elsif params[:search]
      @tasks = Task.search_tasks(params[:search]).page(params[:page]).per(PER)
    else
      @tasks = @tasks.order(created_at: :desc).page(params[:page]).per(PER)
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    #@task = Task.new(task_params)
    @task = current_user.tasks.new(task_params)
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "タスクが登録されました。" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "タスクが更新されました。" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "タスクが削除されました。" }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :content, :status, :priority, :deadline)
  end

end
