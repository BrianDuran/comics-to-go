class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.integer :characted_id
      t.string :name
      t.date :release_date

      t.timestamps null: false
    end
  end
end
