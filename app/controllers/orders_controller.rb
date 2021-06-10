class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  # def index
  #   if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
  #     @item_order = ItemOrder.new
  #   else
  #     redirect_to root_path
  #   end
  # end


  # private

  # def set_item
  #   @item = Item.find(params[:item_id])
  # end

  # def order_params
  #   params.require(:item_order).permit(:postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  # end

end
