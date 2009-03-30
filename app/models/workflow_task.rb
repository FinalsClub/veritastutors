class WorkflowTask < ActiveRecord::Base
  has_one :workflow_task_type
  belongs_to :owner, :class_name => 'User'

  validates_presence_of :workflow_task_type_id
  validates_presense_of :owner_id
  validates_presence_of :target_id
  

end
