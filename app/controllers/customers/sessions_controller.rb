class Customers::SessionsController < Devise::SessionsController

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customer_path(customer.id), notice: 'guestcustomerでログインしました。'
  end
end