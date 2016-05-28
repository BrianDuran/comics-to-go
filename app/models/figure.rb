class Figure < ActiveRecord::Base
  belongs_to :character
  validates_presence_of :name
  validates_presence_of :release_date
  validates_presence_of :character_id
end
