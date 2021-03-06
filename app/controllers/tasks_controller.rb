class TasksController < ApplicationController

  def index
    @list = List.find(params[:list_id])
    @task = @list.tasks.all
    respond_to do |format|
      format.html
      format.csv { send_data @task.to_csv, filename: "List-#{@list.list_name}.csv" }
    end
  end
  
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(task_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@list)
  end
 
  private
    def task_params
      params.require(:task).permit(:task_name, :body)
    end
end
