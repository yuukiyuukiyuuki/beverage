class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @drink = Drink.find(params[:drink_id])
    favorite = current_customer.favorites.new(drink_id: @drink.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @drink = Drink.find(params[:drink_id])
    favorite = current_customer.favorites.find_by(drink_id: @drink.id)
    favorite.destroy
    redirect_to request.referer
  end
end
