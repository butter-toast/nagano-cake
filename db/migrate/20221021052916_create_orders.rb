class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :post_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :shipping_fee, null: false, default: "800"
      t.integer :total_price, null: false, default: ""
      t.integer :pay_method, null: false, default: ""
      t.integer :status, null: false, default: ""
      t.timestamps
    end
  end
end
