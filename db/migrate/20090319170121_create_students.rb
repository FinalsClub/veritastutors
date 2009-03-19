class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end

    add_index :students, :user_id
    add_index :students, :client_id
  end

  def self.down
    drop_table :students
  end
end
