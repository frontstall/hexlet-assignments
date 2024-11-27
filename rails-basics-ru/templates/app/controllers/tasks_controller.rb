# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task has been created'
      redirect_to @task
    else
      flash[:failure] = 'Task cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task has been updated'
      redirect_to @task
    else
      flash[:failure] = 'Task cannot be updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task has been deleted'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be deleted'
    end
  end

  private

  def task_params
    params
      .require(:task)
      .permit(:name, :creator, :performer, :completed, :description, :status)
  end
end
