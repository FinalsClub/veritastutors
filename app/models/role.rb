class Role < ActiveRecord::Base
  AdminId = 1
  ClientId = 2
  StudentId = 3
  TutorId = 4

  Admin = Role.find_by_id(AdminId)
  Client = Role.find_by_id(ClientId)
  Student = Role.find_by_id(StudentId)
  Tutor = Role.find_by_id(TutorId)
end
