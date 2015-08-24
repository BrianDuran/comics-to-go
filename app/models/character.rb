class Character < ActiveRecord::Base
  has_many :comics
  has_many :figures
  validates_presence_of :name
  validates_presence_of :company
end
