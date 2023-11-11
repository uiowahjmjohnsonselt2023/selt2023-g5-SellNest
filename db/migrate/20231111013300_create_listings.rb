class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :photoURL
      t.references :sellerID, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
