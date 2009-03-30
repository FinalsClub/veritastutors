class WorkflowTaskType < ActiveRecord::Base
  has_one :role
  
  validates_presence_of :role_id
  validates_presence_of :patial

end
