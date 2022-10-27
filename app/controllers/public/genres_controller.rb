class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @products = Product.where(genre_id: params[:id]).page(params[:page]).per(6)
  end
end
