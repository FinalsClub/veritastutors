class CreateWorkflowTasks < ActiveRecord::Migration
  def self.up
    create_table :workflow_tasks do |t|
      t.integer :owner_id
      t.integer :workflow_task_type_id
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :workflow_tasks
  end
end
