class Public::DrinksController < ApplicationController

  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
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
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer
      redirect_to customer_path(customer.id)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to customer_path(customer.id)
    else
      render :edit
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to customer_path(customer.id)
  end

  private
    def drink_params
     params.require(:drink).permit(:customer_id, :name, :introduction, :image)
   end
end
