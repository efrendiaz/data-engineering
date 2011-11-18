require 'spec_helper'

describe Customer do
  let(:customer) do
    c = Customer.new
    c.name = "Customer 1"
    c
  end

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
    p.merchant = merchant
    p
  end

  let(:merchant) do
    m = Merchant.new
    m.name = "Merchant 1"
    m.address = "Fake Street"
    m
  end

  before do
    customer.save!
    product.save!
  end
  
  it "should be valid with all required attributes" do
    customer.should be_valid
  end
  
  it "should be invalid without a name" do
    customer.name = nil
    customer.should_not be_valid
  end

  it "should not allow duplicated names" do
    another_customer = customer.dup
    customer.save!
    another_customer.should_not be_valid
  end

  it "should allow many sales" do
    sale.customer = customer
    sale.product = product
    sale.save!
    second_sale = Sale.new(
                           :product => product,
                           :customer =>customer,
                           :product_count => 2)
   
    second_sale.save!
    customer.sales.size.should == 2
  end
end
