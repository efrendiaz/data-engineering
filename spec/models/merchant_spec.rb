require 'spec_helper'

describe Merchant do
  let(:merchant) do
    m = Merchant.new
    m.name = "Merchant 1"
    m.address = "Fake Street"
    m
  end

  let(:product) do
    p = Product.new
    p.description = "test product"
    p.price = 20
    p.merchant = merchant
    p
  end
  
  it "should be valid with all required attributes" do
    merchant.should be_valid
  end

  it "should not be valid without a name" do
    merchant.name = nil
    merchant.should_not be_valid
  end

  it "should have an unique name" do
    merchant.name = "name2"
    second_merchant = merchant.dup
    merchant.save
    second_merchant.should be_invalid
    second_merchant.errors[:name].should_not be_blank
  end

  it "should not be valid without an address" do
    merchant.address = nil
    merchant.should_not be_valid
  end

  it "should have an unique address" do
    merchant.address = "address2"
    second_merchant = merchant.dup
    merchant.save
    second_merchant.should be_invalid
    second_merchant.errors[:address].should_not be_blank
  end

  it "should allow many products" do
    merchant.save!
    second_product = product.dup
    product.save!
    second_product.description = "second"
    second_product.save
    merchant.products.size.should ==2
  end
  
end
