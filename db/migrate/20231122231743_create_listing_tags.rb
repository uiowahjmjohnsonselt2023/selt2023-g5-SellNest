class CreateListingTags < ActiveRecord::Migration[7.1]
  def change
    create_table :listing_tags do |t|

      t.references :tags, index: true, foreign_key: true
      t.references :listings, index: true, foreign_key: true
      t.timestamps
    end
  end
end
