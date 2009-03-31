class WorkflowTaskType < ActiveRecord::Base
  has_one :role
  
  validates_presence_of :role_id
  validates_presence_of :partial

  
  PhoneConsultationId = 1
  OnSiteInterviewId = 2
  InterviewFollowupId = 3
  

end
