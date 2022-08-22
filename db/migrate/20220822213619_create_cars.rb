class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand_model
      t.float :price
      t.string :category
      t.text :description
      t.string :location
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
