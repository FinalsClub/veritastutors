class InitialTaskTypes < ActiveRecord::Migration
  def self.up

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

  end
end
