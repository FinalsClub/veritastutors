class CreateAppointmentRequests < ActiveRecord::Migration
  def self.up
    create_table :appointment_requests do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.datetime :start
      t.datetime :end
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :appointment_requests
  end
end
