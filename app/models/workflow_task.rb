class WorkflowTask < ActiveRecord::Base
  belongs_to :workflow_task_type
  belongs_to :owner, :class_name => 'User'

  validates_presence_of :workflow_task_type_id
  validates_presence_of :owner_id
  validates_presence_of :target_id
  

  # creates a task to come next with all the same values -- essentially
  # a copy constructor without the id. These defaults won't usually make
  # sense, but are the only things that will ever be useful.
  def create_successor_task()

    tsk = WorkflowTask.new
    tsk.owner_id = owner_id
    tsk.workflow_task_type_id = workflow_task_type_id
    tsk.target_id = target_id

    return tsk
  end

end
