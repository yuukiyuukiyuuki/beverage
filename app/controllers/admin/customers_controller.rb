class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  # def update
  # end

  def confirm_withdraw
  end

  def withdraw
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: 'Successfully withdraw from Ecommerce'
  end

   private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :image, :is_deleted)
  end
end
