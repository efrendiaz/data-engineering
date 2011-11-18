require 'spec_helper'

describe Product do

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

  it "should be valid with all the required attributes" do
    product.should be_valid
  end

  it "should not be valid without a description" do
    product.description = nil
    product.should_not be_valid
  end

  it "should not be valid without a merchant" do
    product.merchant = nil
    product.should_not be_valid
  end

  it "should not be valid without a price" do
    product.price = nil
    product.should_not be_valid
  end
  
  it "should not be valid with a non numeric price" do
    product.price = "invalid"
    product.should_not be_valid
  end

  it "should not be valid with a price lower than 0" do
    product.price = -1
    product.should_not be_valid
  end
end
