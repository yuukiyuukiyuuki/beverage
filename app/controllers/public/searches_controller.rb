class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(5)
    else
      @drinks = Drink.looks(params[:search], params[:word]).page(params[:page]).per(5)
    end
  end

end
