class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :product_count
      t.timestamps
    end
  end
end
