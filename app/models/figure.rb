class Figure < ActiveRecord::Base
  belongs_to :character
  validates_presence_of :name
  validates_presence_of :release_date
  validates_presence_of :character_id

  def self.search(search)
    search ? where('name LIKE ?', "%#{search}%") : all
  end

  def self.sort(column, direction)
    return  all.order("#{column} #{direction}") unless column == 'character'
    Figure.includes(:character).order("characters.name #{direction}")
  end
end
