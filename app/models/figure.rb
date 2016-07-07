class Figure < ActiveRecord::Base
  belongs_to :character
  validates_presence_of :name
  validates_presence_of :release_date
  validates_presence_of :character_id

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
