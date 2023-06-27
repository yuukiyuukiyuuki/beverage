class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def index
    @customers=Customer.all.page(params[:page]).per(8)
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

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:drink_id)
    @favorite_drinks = Drink.find(favorites)
  end


private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :image, :is_deleted)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "guestcustomer"
      redirect_to customer_path(current_customer) , notice: 'Guest customers cannot transition to the profile edit screen.'
    end
  end
end
