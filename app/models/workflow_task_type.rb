class WorkflowTaskType < ActiveRecord::Base

  validates_presence_of :partial
  validates_presence_of :name
  
  PhoneConsultationId = 1
  OnSiteInterviewId = 2
  
  PhoneConsultation = WorkflowTaskType.find_by_id(PhoneConsultationId)
  OnSiteInterview = WorkflowTaskType.find_by_id(OnSiteInterviewId)


end
