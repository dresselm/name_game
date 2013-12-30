class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email_address
      t.string :last_name
      t.string :url_token

      t.timestamps
    end

    add_index :users, :email_address, unique: true
    add_index :users, :url_token, unique: true
  end
end
