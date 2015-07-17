class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :name
      t.date :release_date
      t.string :condition
      t.integer :hero_id
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
