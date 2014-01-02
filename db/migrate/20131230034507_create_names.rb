class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.boolean :is_first_name
      t.boolean :is_middle_name

      t.timestamps
    end

    add_index :names, [:name, :is_first_name, :is_middle_name], :unique => true

    # Join table
    create_table :names_users, id: false do |t|
      t.integer :name_id, :null => false
      t.integer :user_id, :null => false
    end

    add_index :names_users, :name_id
    add_index :names_users, :user_id
  end
end
