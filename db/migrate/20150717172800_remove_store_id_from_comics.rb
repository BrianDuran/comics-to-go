class RemoveStoreIdFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :store_id
  end
end
