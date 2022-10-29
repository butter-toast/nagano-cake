class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :purchase_prise
      t.integer :product_status

      t.timestamps
    end
  end
end
