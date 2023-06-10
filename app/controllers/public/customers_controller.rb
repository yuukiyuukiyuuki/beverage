class Public::CustomersController < ApplicationController

  def index
    @drink=Drink.new
  end

  def show
    
    @drink=Drink.new
    @customer=Customer.find(params[:id])
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
