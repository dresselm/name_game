class MatchResult < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :winner, :class_name => 'Contestant', :foreign_key => 'winning_contestant_id'
  belongs_to :loser,  :class_name => 'Contestant', :foreign_key => 'losing_contestant_id'

  validates_presence_of :user, :winner, :loser
end
