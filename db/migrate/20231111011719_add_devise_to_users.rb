class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # Ensure these columns exist, if not, uncomment them
      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""
      t.string :full_name
      t.string :uid
      t.string :avatar_url
      t.string :provider

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable, Confirmable, and Lockable
      # ... (rest of your migration)

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    # Comment out or remove this line if the index already exists
    # add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # ... (rest of your migration)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
