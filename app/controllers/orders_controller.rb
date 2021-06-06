class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @item_order = ItemOrder.new
    else
      redirect_to root_path
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end


end
