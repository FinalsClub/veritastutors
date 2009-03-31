class ConvertRoleIds < ActiveRecord::Migration
  def self.up
    Role.all.each { |r| r.delete }

    r = Role.new :name => "tutor"
    r.id = Role::TutorId
    r.save

    r = Role.new :name => "client"
    r.id = Role::ClientId
    r.save

    r = Role.new :name => "student"
    r.id = Role::StudentId
    r.save

    r = Role.new :name => "admin"
    r.id = Role::AdminId
    r.save
    
  end

  def self.down

    Role.all.each { |r| r.delete }


    Role.create :name => "tutor"
    Role.create :name => "admin"
    Role.create :name => "client"
    Role.create :name => "student"
  end
end
