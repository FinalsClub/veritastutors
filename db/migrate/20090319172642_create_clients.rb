class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.integer :user_id
      t.boolean :is_student

      t.timestamps
    end

    add_index :user_id
  end

  def self.down
    drop_table :clients
  end
end
