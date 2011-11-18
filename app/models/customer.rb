class Customer < ActiveRecord::Base
  has_many :sales
  validates :name, :presence => true
  validates_uniqueness_of :name
end
