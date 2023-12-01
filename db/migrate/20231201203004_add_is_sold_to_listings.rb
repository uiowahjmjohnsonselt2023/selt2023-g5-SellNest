class AddIsSoldToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :is_sold, :boolean
  end
end
