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
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
    redirect_to customer_path(current_customer.id)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save
      flash[:notice] = "You have updated user successfully."
      redirect_to customer_path(@customer)
    else
      render :edit
    end

  end

private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :image, :is_deleted)
  end

end
