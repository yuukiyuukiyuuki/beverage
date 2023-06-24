class Public::DrinksController < ApplicationController

  def index
    @drinks = Drink.all.page(params[:page]).per(8)
  end

  def show
    @drink = Drink.find(params[:id])
    @drink_comment = DrinkComment.new
    @customer = @drink.customer
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
    @drink = Drink.find(params[:id])
    @customer = current_customer
    if @drink.customer_id != current_customer.id
      redirect_to customer_path(@customer.id)
    end
  end

  def update
    @drink = Drink.find(params[:id])
    @drink.update(drink_params)
    if @drink.save
      flash[:notice] = "You have updated user successfully."
      redirect_to drink_path(@drink)
    else
      render :edit
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to customer_path(current_customer)
  end

  private

  def drink_params
    params.require(:drink).permit(:customer_id, :name, :introduction, :image)
  end

end
