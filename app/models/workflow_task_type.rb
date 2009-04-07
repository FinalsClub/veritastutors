class WorkflowTaskType < ActiveRecord::Base
  acts_as_enumerated

  validates_presence_of :partial
  validates_presence_of :name
  
 
end
