class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
