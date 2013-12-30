class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.integer :user_id
      t.string :name
      t.boolean :is_first_name
      t.boolean :is_middle_name

      t.timestamps
    end
    add_index :names, [:user_id, :name], unique: true
  end
end
