class RemoveProductGenreIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :product_genre_id, :integer
  end
end
