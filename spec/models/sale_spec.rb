require 'spec_helper'
describe Sale do
  
  let(:sale) do
    s  =  Sale.new 
    s.product_count = 1
    s.customer = customer
    s.product = product
    s
  end
  
  let(:product) do
    p = Product.new
    p.description = "test product"
    p.price = 20
    p
  end

  let(:customer) do
    c = Customer.new
    c.name = "Customer 1"
    c
  end

  it "should be valid with all required attributes" do
    sale.should be_valid
  end
 
  it "should not be valid without a customer" do
    sale.should be_valid
    sale.customer = nil
    sale.should_not be_valid
  end

  it "should not be valid without a product" do
    sale.should be_valid
    sale.product = nil
    sale.should_not be_valid
  end

  it "should not be valid with a negative product count" do
    sale.should be_valid
    sale.product_count = -1
    sale.should_not be_valid
  end

  it "should not be valid with an empty product count" do
    sale.should be_valid
    sale.product_count = nil
    sale.should_not be_valid
  end

  it "should not be valid with a non integer value" do
    sale.should be_valid
    sale.product_count = "invalid"
    sale.should_not be_valid
  end
  
end
