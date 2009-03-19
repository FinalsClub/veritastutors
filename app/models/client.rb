class Client < ActiveRecord::Base
  has_many :students
  belongs_to :user

  validates_presence_of :user_id
end
