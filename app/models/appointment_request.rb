class AppointmentRequest < ActiveRecord::Base
  enum_field :status, ['requested', 'accepted', 'rejected']

  belongs_to :student
  belongs_to :tutor

  validates_presence_of :student
  validates_presence_of :tutor
end
