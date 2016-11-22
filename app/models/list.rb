class List < ActiveRecord::Base
  has_many :list_items
  validates_presence_of :title
end
