class User < ActiveRecord::Base
  devise :openid_authenticatable, :recoverable,
  :rememberable, :trackable, :timeoutable,:database_authenticatable

  attr_accessible :identity_url

  def self.create_from_identity_url(identity_url)
    self.create(:identity_url => identity_url)
  end
 
end
