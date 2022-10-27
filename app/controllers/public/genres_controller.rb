class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @products = Product.where(genre_id: params[:id])
  end
end
