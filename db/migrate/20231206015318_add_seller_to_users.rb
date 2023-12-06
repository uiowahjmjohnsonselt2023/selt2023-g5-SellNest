class AddSellerToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sellers, :boolean, default: false
  end
end
