class Public::CustomersController < ApplicationController

  def index
    @customers=Customer.all
  end

  def show
    @customer=Customer.find(params[:id])
    @drinks=@customer.drinks
    @drink=Drink.new
  end

  def edit
  end

  def update
  end

private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :image, :is_deleted)
  end

end
