class Public::DrinkCommentsController < ApplicationController

  def create
    @drink = Drink.find(params[:drink_id])
    @comment = current_customer.drink_comments.new(drink_comment_params)
    @comment.drink_id = @drink.id
    @comment.save
  end

  def destroy
    DrinkComment.find_by(id: params[:id],drink_id: params[:drink_id]).destroy
    @drink = Drink.find(params[:drink_id])
  end

   private

  def drink_comment_params
    params.require(:drink_comment).permit(:comment)
  end

end
