class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
    if params[:sort_expired]
			@tasks = @tasks.order(deadline: :desc).page params[:page]
    else
      @tasks = @tasks.order(created_at: :desc).page params[:page]
    end

    if params[:sort_priority_high]
      @tasks = @tasks.order(priority: :asc).page params[:page]
    else
      @tasks = @tasks.order(created_at: :desc).page params[:page]
    end

    if params[:task].present?
      if params[:task][:title].present? && params[:task][:status].present?
        #両方title and statusが成り立つ検索結果を返す
        @tasks = @tasks.where('title LIKE ?', "%#{params[:task][:title]}%").page params[:page]
        @tasks =@tasks.where(status: params[:task][:status]).page params[:page]
        
        #渡されたパラメータがtask titleのみだったとき
      elsif params[:task][:title].present?
        @tasks = @tasks.where('title LIKE ?', "%#{params[:task][:title]}%").page params[:page]
      
       #渡されたパラメータがステータスのみだったとき
      elsif params[:task][:status].present?
        @tasks =@tasks.where(status: params[:task][:status]).page params[:page]
      end
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
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "タスクが登録されました。" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
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
