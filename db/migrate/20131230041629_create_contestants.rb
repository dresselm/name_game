class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.integer :first_name_id,  :null => false
      t.integer :middle_name_id, :null => false

      t.timestamps
    end

    add_index :contestants, [:first_name_id, :middle_name_id], :unique => true
  end
end
