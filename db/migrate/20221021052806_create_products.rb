class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :no_tax_price, null: false
      t.boolean :is_sale_status, null: false, default:false

      t.timestamps
    end
  end
end
