require 'digest/md5'

class User < ActiveRecord::Base
  has_and_belongs_to_many :names
  has_and_belongs_to_many :match_results

  # TODO not sure this is necessary
  has_many :standings

  before_create :create_url_token

  validates_presence_of :email_address, :last_name

  def create_url_token
    self.url_token ||= Digest::MD5.hexdigest(email_address)
  end
end
