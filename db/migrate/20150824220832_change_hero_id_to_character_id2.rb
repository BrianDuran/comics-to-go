class ChangeHeroIdToCharacterId2 < ActiveRecord::Migration
  def change
  	rename_column :figures, :hero_id, :character_id
  end
end
