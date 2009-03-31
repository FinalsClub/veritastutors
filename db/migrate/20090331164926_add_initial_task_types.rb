class AddInitialTaskTypes < ActiveRecord::Migration
  def self.up

    # decided to push role decisions into the task-specific logic
    # and remove role requirements
    remove_column :workflow_task_types, :owner_role_id

    # names will be useful for tracking
    add_column :workflow_task_types, :name, :string


    wtt = WorkflowTaskType.new
    wtt.id = WorkflowTaskType::PhoneConsultationId
    wtt.partial = 'simple_workflow_tasks/phone_consultation'
    wtt.name = 'Initial Phone Consultation'
    wtt.save
   
    wtt = WorkflowTaskType.new
    wtt.id = WorkflowTaskType::OnSiteInterviewId
    wtt.partial = 'simple_workflow_tasks/on_site_interview'
    wtt.name = 'Initial Onsite Interview'
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
