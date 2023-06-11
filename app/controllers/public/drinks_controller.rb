class Public::DrinksController < ApplicationController

  def index
    @drinks = Drink.all
  end

  def show
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = current_customer.drinks.build(drink_params)
    if @drink.save
      flash[:notice] = "success"
      redirect_to drinks_path
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
    def drink_params
     params.require(:drink).permit(:customer_id, :name, :introduction, :comment, :image)
   end
end
