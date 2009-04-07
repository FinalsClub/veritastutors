class InitialTaskTypes < ActiveRecord::Migration
  def self.up

    wtt = WorkflowTaskType.new
    wtt.partial = 'simple_workflow_tasks/phone_consultation'
    wtt.name = 'Initial Phone Consultation'
    wtt.save
   
    wtt = WorkflowTaskType.new
    wtt.partial = 'simple_workflow_tasks/on_site_interview'
    wtt.name = 'Initial Onsite Interview'
    wtt.save

  end

  def self.down

    if(WorkflowTaskType[:initial_consultation])
      WorkflowTaskType[:initial_consultation].delete
    end

    if(WorkflowTaskType[:initial_interview])
      WorkflowTaskType[:initial_interview].delete
    end
  end
end
