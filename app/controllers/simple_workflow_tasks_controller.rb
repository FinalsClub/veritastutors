class SimpleWorkflowTasksController < ApplicationController

  def complete_phone_consultation
    @task = WorkflowTask.find(params[:id])
    
    @newTask = @task.create_successor_task
    @newTask.workflow_task_type_id = WorkflowTaskType::OnSiteInterviewId
    @newTask.save

    @task.delete
    redirect_back_or_default('/')
  end


  def complete_on_site_interview
    @task = WorkflowTask.find(params[:id])
    
    @task.delete    
    redirect_back_or_default('/')
  end



end
