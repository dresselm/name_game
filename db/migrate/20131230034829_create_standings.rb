class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer :user_id
      t.integer :contestant_id

      t.timestamps
    end

    add_index :standings, [:user_id, :contestant_id], :unique => true
  end
end
