class User < ActiveRecord::Base
  has_many :lists
  has_secure_password
  validates_presence_of :username, :email

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end
end
