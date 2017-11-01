class CreateNuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :nuzzles do |t|
      t.references :animal, null: false
      t.references :owner
      t.timestamps
    end
  end
end
