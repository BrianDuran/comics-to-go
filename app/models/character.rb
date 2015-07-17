class Character < ActiveRecord::Base
  has_many :comics
  validates_presence_of :name
  validates_presence_of :company
end
