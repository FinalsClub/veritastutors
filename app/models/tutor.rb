class Tutor < ActiveRecord::Base
  belongs_to :user
  has_many :appointment_requests
end
