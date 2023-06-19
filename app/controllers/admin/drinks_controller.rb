class Admin::DrinksController < ApplicationController

  def index
    @drinks = Drink.all.page(params[:page]).per(8)
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to admin_drinks_path
  end

  private

  def drink_params
    params.require(:drink).permit(:customer_id, :name, :introduction, :image)
  end

end
