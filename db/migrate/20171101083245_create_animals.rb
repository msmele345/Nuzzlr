class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.string :image_url, null: false
      t.integer :nuzzle_count, default: 0
      t.references :uploaded_owner

     t.timestamps
    end
  end
end
