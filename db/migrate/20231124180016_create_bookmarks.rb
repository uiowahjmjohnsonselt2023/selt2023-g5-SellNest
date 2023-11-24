class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
