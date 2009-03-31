class UpdateWorkflowTaskTypes < ActiveRecord::Migration
  def self.up

    # decided to push role decisions into the task-specific logic
    # and remove role requirements
    remove_column :workflow_task_types, :owner_role_id

    # names will be useful for tracking
    add_column :workflow_task_types, :name, :string

  end

  def self.down
    remove_column :workflow_task_types, :name
    add_column :workflow_task_types, :owner_role_id, :integer
  end

end
