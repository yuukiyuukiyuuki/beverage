class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @drinks = Drink.looks(params[:search], params[:word])
    end
  end

end
