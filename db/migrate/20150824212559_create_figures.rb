class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
    	t.string :name
    	t.date :release_date
 		t.integer :hero_id
    	t.timestamps null: false
    end
  end
end
