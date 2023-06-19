class Public::RelationshipsController < ApplicationController

  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
    @customer = Customer.find(params[:customer_id])
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
    @customer = Customer.find(params[:customer_id])
  end

end
