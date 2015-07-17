module ApplicationHelper
  def getCharacterName(id)
    c = Character.where(:id => id).first
    c.name unless c.nil?
  end
end
