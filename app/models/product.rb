class Product < ActiveRecord::Base
  belongs_to :merchant
  validates :merchant, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
  validates_numericality_of :price, :only_integer => true, :greater_than => 0
end
