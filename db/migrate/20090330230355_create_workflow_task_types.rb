class CreateWorkflowTaskTypes < ActiveRecord::Migration
  def self.up
    create_table :workflow_task_types do |t|
      t.integer :owner_role_id
      t.string :partial

      t.timestamps
    end
  end

  def self.down
    drop_table :workflow_task_types
  end
end
