class AddInitialTaskTypes < ActiveRecord::Migration
  def self.up

    # decided to push role decisions into the task-specific logic
    # and remove role requirements
    remove_column :workflow_task_types, :owner_role

    # names will be useful for tracking
    add_column :workflow_task_types, :name, :string


    wtt = WorkflowTaskType.new
    wtt.id = WorkflowTaskType::PhoneConsultation
    wtt.partial = 'simple_workflow_task_controller/phone_consultation'
    wtt.save
   
    wtt = WorkflowTaskType.new
    wtt.id = WorkflowTaskType::OnSiteInterview
    wtt.partial = 'simple_workflow_task_controller/on_site_interview'
    wtt.save
   
  end

  def self.down
    if(WorkflowTaskType::PhoneConsultation)
      WorkflowTaskType::PhoneConsultation.delete
    end

    if(WorkflowTaskType::OnSiteInterview)
      WorkflowTaskType::OnSiteInterview.delete
    end

    remove_column :workflow_task_types, :name
    add_column :workflow_task_types, :owner_role_id, :integer
  end

end
