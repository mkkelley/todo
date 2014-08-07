class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.json {render json: @task}
    end
  end

  def index
    @tasks = Task.order(created_at: :desc)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      begin
        @task.save!
        format.html { redirect_to tasks_path }
        format.json { render json: @task, status: :created, location: tasks_path }
      rescue Exception => e
        flash[:notice] = "Task not created: #{e}"
        format.html { redirect_to tasks_path }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      begin
        @task.update(task_params)
        #format.html { redirect_to tasks_path }
        format.json { render json: @task, status: :ok }
      rescue Exception => e
        flash[:notice] = "Task not created: #{e}"
        format.html { redirect_to tasks_path }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.json { head :no_content }
    end
  end

private
  def task_params
    params.require(:task).permit(:name, :description, :completed)
  end
end
