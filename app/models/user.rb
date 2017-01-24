class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  has_secure_password
  validates_presence_of :username, :email
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end
end
