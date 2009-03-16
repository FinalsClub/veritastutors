class AddVtRoles < ActiveRecord::Migration
  def self.up
    Role.create :name => "tutor"
    Role.create :name => "admin"
    Role.create :name => "client"
    Role.create :name => "student"
  end

  def self.down
    Role.delete_all
  end
end
