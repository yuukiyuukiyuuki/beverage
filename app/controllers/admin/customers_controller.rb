class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page]).per(8)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def confirm_withdraw
    @customer = Customer.find(params[:customer_id])
  end

  def withdraw
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to admin_customers_path, notice: 'Successfully withdraw from Ecommerce'
  end

   private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :image, :is_deleted)
  end
end
