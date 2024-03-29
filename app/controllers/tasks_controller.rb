class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  def index
    @tasks = current_user.tasks.joins(:labels).where(labels: { id: params[:label_search]}).page(params[:page]).per(10) and return if params[:label_search].present?
    @tasks = current_user.tasks.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10) and return unless params[:task].present?
    if params[:task][:status].present? && params[:task][:name].present?
      @tasks = current_user.tasks.search_by_both(params[:task][:status], params[:task][:name]).page(params[:page]).per(10)
    elsif params[:task][:status].present?
      @tasks = current_user.tasks.search_by_status(params[:task][:status]).page(params[:page]).per(10)
    elsif params[:task][:name]
      @tasks = current_user.tasks.search_by_name(params[:task][:name]).page(params[:page]).per(10)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_url(@task), notice: "タスクを作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_url(@task), notice: "タスクを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスクを削除しました"
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :content, :deadline, :status, :priority, label_ids: [])
  end

  def sort_direction
    %w[asc desc].include?(params[:direction])? params[:direction]: 'desc'
  end

  def sort_column
    Task.column_names.include?(params[:sort])? params[:sort] : 'created_at'
  end
end
