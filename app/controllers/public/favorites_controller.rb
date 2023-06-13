class Public::FavoritesController < ApplicationController

  def create
  @drink_favorite = Favorite.new(customer_id: customer.id, drink_id: params[:drink_id])
  @drink_favorite.save
  redirect_to drink_path(params[:drink_id])
  end

  def destroy
  @drink_favorite = Favorite.find_by(customer_id: customer.id, drink_id: params[:drink_id])
  @drink_favorite.destroy
  redirect_to drink_path(params[:drink_id])
end
end
