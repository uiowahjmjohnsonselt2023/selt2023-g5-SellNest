class AddDefaultToIsSoldColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :is_sold, :boolean, default: false
  end
end
