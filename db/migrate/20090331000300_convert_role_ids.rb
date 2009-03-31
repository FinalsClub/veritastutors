class ConvertRoleIds < ActiveRecord::Migration
  def self.up
    Role.all.each { |r| r.delete }

    Role.create :id => Role::TutorId, :name => "tutor"
    Role.create :id => Role::AdminId, :name => "admin"
    Role.create :id => Role::ClientId, :name => "client"
    Role.create :id => Role::StudentId, :name => "student"    
    
  end

  def self.down
    Role.create :name => "tutor"
    Role.create :name => "admin"
    Role.create :name => "client"
    Role.create :name => "student"
  end
end
