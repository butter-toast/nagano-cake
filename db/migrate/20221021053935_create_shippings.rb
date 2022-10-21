class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.integer :customer_id
      t.string :name
      t.string :post_code
      t.string :address

      t.timestamps
    end
  end
end
