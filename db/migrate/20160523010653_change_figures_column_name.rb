class ChangeFiguresColumnName < ActiveRecord::Migration
  def change
    rename_column :figures, :character_id, :character_id
  end
end
