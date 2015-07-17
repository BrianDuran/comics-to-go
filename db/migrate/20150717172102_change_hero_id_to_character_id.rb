class ChangeHeroIdToCharacterId < ActiveRecord::Migration
  def change
    rename_column :comics, :hero_id, :character_id
  end
end
