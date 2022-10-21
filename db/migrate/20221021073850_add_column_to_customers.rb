class AddColumnToCustomers < ActiveRecord::Migration[6.1]
  def change

    add_column :customers, :last_name, :string ,null: false

    add_column :customers,:first_name, :string , null: false

    add_column :customers, :last_name_kana, :string , null: false

    add_column :customers,:first_name_kana, :string , null: false

    add_column :customers,:post_code, :string , null: false

    add_column :customers,:address, :string , null: false

    add_column :customers,:phone_number, :string , null: false

    add_column :customers,:is_withdrawal, :boolean , null:false, default:false
  end
end
