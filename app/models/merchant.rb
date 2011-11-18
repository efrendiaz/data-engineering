class Merchant < ActiveRecord::Base
  has_many :products
  validates :name, :presence => true
  validates :address, :presence => true
  validates_uniqueness_of :name
  validates_uniqueness_of :address
end
