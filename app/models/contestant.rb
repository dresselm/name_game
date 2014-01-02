class Contestant < ActiveRecord::Base
  belongs_to :first_name, :class_name  => 'Name', :foreign_key => 'first_name_id'
  belongs_to :middle_name, :class_name => 'Name', :foreign_key => 'middle_name_id'

  validates_presence_of :first_name, :middle_name

  # TODO implement these
  # scope :for_user,
  # scope :wins,
  # scope :losses,

  def full_name
    "#{first_name.name} #{middle_name.name}"
  end
end
