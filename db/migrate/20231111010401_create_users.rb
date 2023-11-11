class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :seller, default: false
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
