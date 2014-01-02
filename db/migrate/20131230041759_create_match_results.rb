class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :winning_contestant_id, :null => false
      t.integer :losing_contestant_id,  :null => false
    end

    create_table :match_results_users, :id => false do |t|
      t.integer :user_id,          :null => false
      t.integer :match_results_id, :null => false

      t.timestamps
    end
  end
end
