require 'csv'
class Importer
  def initialize(file)
    @file = file.is_a?(String) ? file : file.path 
  end
  
  def parse
    CSV.read(@file,{:headers => :first_row, :col_sep => "\t"})
  end
  
  def import_data
    data = parse
    data.delete(data.first)
    gross_revenue = 0
    data.each do|row|
      begin 
        customer = Customer.find_or_create_by_name(row[0],
                                                   :name => row[0])
        merchant = Merchant.find_or_create_by_name(row[5],
                                                   :address =>row[4],
                                                   :name => row[5])
        product = Product.
          find_or_create_by_description(row[1],
                                        :merchant => merchant,
                                        :description => row[1],
                                        :price =>row[2])
        gross_revenue += product.price * row[3].to_f
        Sale.new(:product => product,
                 :customer => customer,
                 :product_count => row[3]).save!
      rescue ActiveRecord::RecordInvalid        
      end
    end
    gross_revenue   
  end
end

