class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end

    add_index :user_id
    add_index :client_id
  end

  def self.down
    drop_table :students
  end
end
