class ChangePhotoUrlToJsonInListings < ActiveRecord::Migration[7.1]
  def up
    remove_column :listings, :photoURL
    add_column :listings, :photos, :json
  end

  def down
    remove_column :listings, :photos
    add_column :listings, :photoURL, :string
  end
end
