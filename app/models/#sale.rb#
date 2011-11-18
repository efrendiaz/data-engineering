class Sale < ActiveRecord::Base
  belongs_to :customer
  has_one :product
  validates :customer, :presence => true
  validates :product, :presence => true
  validates :product_count,:presence =>true
  validates_numericality_of :product_count, :only_integer => true, :greater_than => 0
  
end
