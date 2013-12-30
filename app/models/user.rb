require 'digest/md5'

class User < ActiveRecord::Base
  has_many :names
  has_many :games
  has_many :standings

  before_validation :create_url_token

  validates_presence_of :email_address, :last_name, :url_token

  def create_url_token
    self.url_token ||= Digest::MD5.hexdigest(email_address)
  end
end
