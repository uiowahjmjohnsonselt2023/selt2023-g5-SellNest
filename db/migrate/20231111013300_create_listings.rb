class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :photoURL

      # Assuming each listing is associated with a user (seller)
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
