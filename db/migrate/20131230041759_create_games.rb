class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :winning_contestant_id
      t.integer :losing_contestant_id

      t.timestamps
    end
  end
end
