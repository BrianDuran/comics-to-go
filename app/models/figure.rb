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

  def self.sort(column, direction)
    if column == 'character'
        @figures = Figure.includes(:character).order("character.name" + " #{direction}")
        puts '-------------------------'
        @figures.each do |figure|
          puts figure
        end
        puts '-------------------------'
    end
    all.order("#{column}" + " #{direction}")
  end
end
