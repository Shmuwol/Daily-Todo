class ListItem < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :name
end
