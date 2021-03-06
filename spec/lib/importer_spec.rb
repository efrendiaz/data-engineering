require 'spec_helper'
require 'importer'
require 'csv'
describe Importer do
  let(:path) do
    File.dirname(__FILE__) + "/../data/test.csv" 
  end
  let(:importer) do
    Importer.new(path)
  end
  
  let(:data) do
    CSV.read(path,{:headers => :first_row, :col_sep => "\t"})
  end
  
  it "should parse tab delimited file" do
    importer.parse.should == data
  end

  it "should import the data to the database" do
    importer.import_data
    Customer.count.should == 2
    Merchant.count.should == 2
    Product.count.should == 2
    Sale.count.should == 4
  end

  it "should return the gross revenue" do
    importer.import_data.should == 100.0
  end
end
