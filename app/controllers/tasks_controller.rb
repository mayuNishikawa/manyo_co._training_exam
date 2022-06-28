class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  def index
    if params[:task].present?
      @tasks = Task.search(params[:task][:name])
    else
      @tasks = Task.all.order("#{sort_column} #{sort_direction}")
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
    @task = Task.new(task_params)
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
      params.require(:task).permit(:name, :content, :deadline)
    end

    def sort_direction
      %w[asc desc].include?(params[:direction])? params[:direction]: 'desc'
    end

    def sort_column
      Task.column_names.include?(params[:sort])? params[:sort] : 'created_at'
    end
end
