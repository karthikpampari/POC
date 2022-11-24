class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :productid
      t.string  :product_name
      t.integer :quantity
      t.decimal :subtotal
      t.integer :order_id
    end
  end
end
